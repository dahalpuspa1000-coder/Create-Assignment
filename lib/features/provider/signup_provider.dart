import 'package:flutter/material.dart';
import 'package:provider_test/core/constants/app_api.dart';
import 'package:provider_test/core/services/api_service.dart';
import 'package:provider_test/core/utils/api_response.dart';
import 'package:provider_test/core/utils/view_state.dart';
import 'package:provider_test/features/home/model/signup.dart';
import 'package:provider_test/features/settings/settingpage.dart';
import 'package:provider_test/homepage.dart';
class SignupProvider extends ChangeNotifier{
    int index=0;
     List<String> genders = ["male", "female", "others"];
  List<String> roles = ["teacher", "student", "Admin"];
    String? name, gender, email, contact, username, password, role;
  
      ViewState signupStatus=ViewState.idle;
  String? errorMessage;
  ApiService service=ApiService();
  setSignupState(ViewState value){
    signupStatus=value;
    notifyListeners();
  }
  Future<void> SignupUser() async{
    setSignupState(ViewState.loading);
    Signup signup=Signup(email:email,password:password,username: username,name: name,role: role,contact: contact,gender: gender);
   ApiResponse response=await service.post(
      AppApi.Firstapp,
      data: signup.toJson(),
    );
    if (response.state==ViewState.success){
setSignupState(ViewState.success);
    }
    else if (response.state ==ViewState.error){
      setSignupState(ViewState.error);
      errorMessage=response.errorMessage;
    
    }
  }
  // Future<void> Assignmentcreateuser() async{
  //    setSignupState(ViewState.loading);
  //    Createassignment createassignment=Createsssignment()
  // }
List<Widget>barlist=[
  Settingpage(),Homepage1(),
  ];

}
