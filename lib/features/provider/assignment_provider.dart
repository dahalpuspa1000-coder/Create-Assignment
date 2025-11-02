import 'package:flutter/material.dart';
import 'package:provider_test/core/constants/app_api.dart';
import 'package:provider_test/core/services/api_service.dart';
import 'package:provider_test/core/utils/api_response.dart';
import 'package:provider_test/core/utils/view_state.dart';
import 'package:provider_test/features/home/model/assingnmentsaddmodel.dart';
import 'package:provider_test/features/home/model/get_assignment.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AssignmentProvider extends ChangeNotifier {
  ViewState getSubjectStatus=ViewState.idle;
  ViewState addAssignmenStatus=ViewState.idle;
  ViewState assignmentListStatus =ViewState.idle;
  List<Subject> subjectlist=[];
  List<AssignmentList1> assignmentList=[];
  String selectedSubjectId="";
  ApiService apiService=ApiService();
  String?  assignmentId, title, description, subjectId, subjectName, teacher, deadline,faculty, semester;
  List<String>faculties=["BCA","CSIT","BIM"];
  List<String> roles = ["teacher", "student", "Admin"];
   ViewState signupStatus=ViewState.idle;
    ViewState createAssignmentStatus=ViewState.idle;
      ViewState getAssignmentStatus = ViewState.idle;
  String? errorMessage;
  String? role;
  ApiService service=ApiService();
  setSignupState(ViewState value){
    signupStatus=value;
    notifyListeners();
  }

  List<String>sem=["First Semester","Second Semester","Third Semester","Fourth Semester","Fifth Semester","Sixth Semester","Seventh Semester","Eight Semester"];
  setSubjectStatus(ViewState state){
    getSubjectStatus=state;
    notifyListeners();
  }

  setCreateAssignmentStatus(ViewState state){
    createAssignmentStatus=state;
    notifyListeners();
  }

  Future<void> getSubject() async{
    setSubjectStatus(ViewState.loading);
    final SharedPreferences prefs= await SharedPreferences.getInstance();
    final String? token=prefs.getString('auth_token');
    ApiResponse apiResponse=await apiService.get(
      endpoint: AppApi.getSubjects,
      token: token,
    );
    if (apiResponse.state==ViewState.success){
      subjectlist.addAll(
        (apiResponse.data['data'] as List<dynamic>).map((e)=> Subject.fromJson(e)).toList(),);
        print(subjectlist);
        setSubjectStatus(ViewState.success);
    }
    else if(apiResponse.state==ViewState.success){
      setSubjectStatus(ViewState.error);
    }
  }
  setGetAssignmentStatus(ViewState state){
    getSubjectStatus=state;
    notifyListeners();
  }
   Future<void> getAssignments() async {
    setGetAssignmentStatus(ViewState.loading);
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? token = prefs.getString('auth_token');
    role = prefs.getString('user_role');

    ApiResponse apiResponse = await apiService.get(
      endpoint: AppApi.getAssignment,
      token: token,
    );
    if (apiResponse.state == ViewState.success) {
      assignmentList.addAll(
        (apiResponse.data['data'] as List<dynamic>)
            .map((e) => AssignmentList1.fromJson(e))
            .toList(),
      );
      print(assignmentList);
      setGetAssignmentStatus(ViewState.success);
    } else if (apiResponse.state == ViewState.error) {
      setGetAssignmentStatus(ViewState.error);
    }
  }
Future<void> createAssignment()async{
setCreateAssignmentStatus(ViewState.loading);
  final SharedPreferences prefs= await SharedPreferences.getInstance();
    final String? token=prefs.getString('auth_auth');
    AssingmentAddModel assingnmentsaddmode=AssingmentAddModel(
      title:title,
      semester:semester,
      faculty:faculty,
      subjectId:selectedSubjectId,
      description:description,
      deadline: deadline,
    );
    ApiResponse apiResponse=await apiService.post(
      AppApi.createAssignment,
      data:assingnmentsaddmode.toJson(),
      token: token,
    );
    if(apiResponse.state==ViewState.success){
      setCreateAssignmentStatus(ViewState.success);
    }else if(
      apiResponse.state==ViewState.error
    ){
      setCreateAssignmentStatus(ViewState.error);
    }

}
}