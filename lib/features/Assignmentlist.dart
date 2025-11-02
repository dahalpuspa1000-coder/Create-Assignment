import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_test/core/constants/app_color.dart';
import 'package:provider_test/core/constants/app_string.dart';
import 'package:provider_test/core/utils/helper.dart';
import 'package:provider_test/core/utils/view_state.dart';
import 'package:provider_test/features/login.dart';
import 'package:provider_test/features/provider/assignment_provider.dart';
import 'package:provider_test/features/widgets/custom_dropdownbutton.dart';
import 'package:provider_test/features/widgets/custom_elevatedbutton.dart';
import 'package:provider_test/features/widgets/custom_textformfield.dart';
class AssignmentList extends StatefulWidget {
  AssignmentList({super.key});
 @override
  State<AssignmentList> createState() => _MyappState();
}
class _MyappState extends State<AssignmentList> {
  final _formKey = GlobalKey<FormState>();
  Response? response;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: () {}, icon: Icon(Icons.arrow_back_ios)),
      ),
      body: Consumer<AssignmentProvider>(
        builder: (context, assignmentProvider, child) => Column(
          children: [
        Form(
          key: _formKey,
          child: Column(
            children: [
              Text(
                "Get Assignment",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
               CustomTextformfield(
                  labelText:titlestr,
                  onChanged: (p0) {
                    assignmentProvider.title=p0;
                  },
              validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the title';
                  }
                  return null; // return null if the input is valid
                },
              ),
              SizedBox(height: 20),
              CustomTextformfield(
                onChanged: (value) {
                  assignmentProvider.description = value;
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please describe';
                  }
                  return null; // return null if the input is valid
                },
          
                labelText: descriptionstr,
              ),
              SizedBox(height: 20),
              CustomTextformfield(
                onChanged: (value) {
                  assignmentProvider.subjectId = value;
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter subject_id';
                  }
                  return null; // return null if the input is valid
                },
          
                labelText: subject_idstr,
              ),
              SizedBox(height: 20),
               CustomDropdown(
                    labelText: facultystr,
                    itemlist: assignmentProvider.faculties,
                    onChanged: (value) {
                     assignmentProvider.roles=value;
                    },
                    validator: (value) {
                      if (value == null) {
                        return "Please choose one choice";
                      }
                      return null;
                    },
                  ),CustomDropdown(
                    labelText: semesterstr,
                    itemlist: assignmentProvider.sem,
                    onChanged: (value) {
                     assignmentProvider.roles=value;
                    },
                    validator: (value) {
                      if (value == null) {
                        return "Please choose one choice";
                      }
                      return null;
                    },
                  ),
              SizedBox(height: 20),
              CustomElevatedbotton(
                 child : assignmentProvider.createAssignmentStatus==ViewState.loading? CircularProgressIndicator(): Text(createlable),
                foregroundColor:white,
                backgroundColor: primarycolor,
     onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      await assignmentProvider.createAssignment();
                            if (assignmentProvider.createAssignmentStatus == ViewState.success) {
                              displaySnackbar(context, loginsuccessstr);
                             // Navigator.of(context).pushAndRemoveUntil(
                              //  MaterialPageRoute(
                                 // builder: (context) => Login1(),
                               // ),
                               // (Route<dynamic> route) => false,
                              //);
                            }else if(assignmentProvider.signupStatus==ViewState.error){
                              displaySnackbar(context, assignmentProvider.errorMessage?? errorMessagelable);
                            } 
                    }
                  },
              ),
            ],
          ),
        ),
          ],
        ),
         
      ),
    );
  }
}