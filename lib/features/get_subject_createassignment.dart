import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_test/core/constants/app_string.dart';
import 'package:provider_test/core/utils/helper.dart';
import 'package:provider_test/core/utils/view_state.dart';
import 'package:provider_test/features/Assignmentlist.dart';
import 'package:provider_test/features/assigned_tab.dart';
import 'package:provider_test/features/provider/assignment_provider.dart';
import 'package:provider_test/features/widgets/custom_dropdownbutton.dart';
import 'package:provider_test/features/widgets/custom_elevatedbutton.dart';
import 'package:provider_test/features/widgets/custom_textformfield.dart';

class GetSubject extends StatefulWidget {
  const GetSubject({super.key, String? semester});

  @override
  State<GetSubject> createState() => _AddAssignmentState();
}

class _AddAssignmentState extends State<GetSubject> {
  @override
  void initState() {
    Future.microtask(() {
      getSubjects();
    });
    super.initState();
  }

  void getSubjects() async {
    final assignmentProvider = Provider.of<AssignmentProvider>(
      context,
      listen: false,
    );
    await assignmentProvider.getSubject();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(createAssignmentstr),
      ),
      body: SingleChildScrollView(
        child: Consumer<AssignmentProvider>(
          builder: (context, assignmentProvider, child) => Stack(
            children: [
              GetsubUi(assignmentProvider),
              assignmentProvider.addAssignmenStatus==ViewState.loading? backdropFilter(context):SizedBox(),
            ],
          )
        ),
      ),
    );
  }
  Widget GetsubUi(AssignmentProvider assignmentProvider)=>Column(
            children: [
             CustomTextformfield(
               onChanged: (value) {
            assignmentProvider.title=value;
          },
                hintText: titlestr,
              ),
              SizedBox(height: 10),
              CustomTextformfield(
                 onChanged: (value) {
            assignmentProvider.description=value;
          },
                hintText: descriptionstr,
              ),
              SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: DropdownButtonFormField(
                            isExpanded: true,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  hint:Text(subjectidstr) ,
                  decoration: InputDecoration(border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12)
                  )),
                  items: assignmentProvider.subjectlist
                      .map(
                        (e) => DropdownMenuItem(
                          child: Text(e.name!),
                          value: e.subjectId,
                        ),
                      )
                      .toList(),
                  onChanged: (value) {
                    assignmentProvider.selectedSubjectId= value!;
                  },
                  
                ),
              ),
              SizedBox(height: 10),
         CustomTextformfield(
          onChanged: (value) {
            assignmentProvider.deadline=value;
          },
          hintText: deadlinelable,
         ),
         SizedBox(height: 20),
            CustomDropdown(
              
          labelText: facustr,
          onChanged: (p0) {
            assignmentProvider.semester=p0;
          },
          itemlist: assignmentProvider.sem,
             validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please choose one';
                      }
                      return null; // return null if the input is valid
                    },
           ),
        SizedBox(height: 20),
         CustomDropdown(
          labelText: facustr,
          onChanged: (p0) {
            assignmentProvider.faculty=p0;
          },
          itemlist: assignmentProvider.faculties,
             validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please choose one';
                      }
                      return null; // return null if the input is valid
                    },
           ),
           SizedBox(height: 20),
         CustomElevatedbotton(foregroundColor: Colors.white,
         backgroundColor: Colors.purple,
          child: Text(createlable),
         onPressed: () async {
                          await assignmentProvider.createAssignment();

                          if (assignmentProvider.createAssignmentStatus == ViewState.success) {
                            displaySnackbar(context, createAssignmentstr);
                            Navigator.of(context).pushAndRemoveUntil(
                              MaterialPageRoute(
                                builder: (context) =>Assigned(),
                              ),
                              (Route<dynamic> route) => false,
                            );
                          } else if (assignmentProvider.createAssignmentStatus ==
                              ViewState.error) {
                            displaySnackbar(
                              context,
                              assignmentProvider.errorMessage ?? errormessstr,
                            );
                          }
                        },
         ),
            ],
          );
}