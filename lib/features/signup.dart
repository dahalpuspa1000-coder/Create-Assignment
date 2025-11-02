import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_test/core/constants/app_color.dart';
import 'package:provider_test/core/constants/app_string.dart';
import 'package:provider_test/core/utils/helper.dart';
import 'package:provider_test/core/utils/view_state.dart';
import 'package:provider_test/features/login.dart';
import 'package:provider_test/features/provider/signup_provider.dart';
import 'package:provider_test/features/widgets/custom_dropdownbutton.dart';
import 'package:provider_test/features/widgets/custom_elevatedbutton.dart';
import 'package:provider_test/features/widgets/custom_textformfield.dart';
class Firstapp extends StatefulWidget {
  Firstapp({super.key});
 @override
  State<Firstapp> createState() => _MyappState();
}
class _MyappState extends State<Firstapp> {
  final _formKey = GlobalKey<FormState>();
  Response? response;
  void initstate(){
    Future.microtask((){
      
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: IconButton(onPressed: (){}, icon: Icon(Icons.add)),
      appBar: AppBar(
        leading: IconButton(onPressed: () {}, icon: Icon(Icons.arrow_back_ios)),
      ),
      body: SingleChildScrollView(
        child: Consumer<SignupProvider>(
          builder: (context, signupProvider, child) => Stack(
            children: [
              SignupUi(signupProvider),
              signupProvider.signupStatus==ViewState.loading? backdropFilter(context):SizedBox(),
            ],
          ),
        ),
      ),
    );
  }
  Widget SignupUi(SignupProvider signupProvider)=>Column(
            children: [
          Form(
            key: _formKey,
            child: Column(
              children: [
                Text(
                  signupstr,
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                CustomTextformfield(
                  onChanged: (value) {
                    signupProvider.email = value;
                  },
                  labelText: emailstr,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                     //return 'Please enter your email';
                    }
                    return null; // return null if the input is valid
                  },
                ),
                SizedBox(height: 20),
                CustomTextformfield(
                  onChanged: (value) {
                    signupProvider.username = value;
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your username';
                    }
                    return null; // return null if the input is valid
                  },
            
                  labelText: usernamestr,
                ),
                SizedBox(height: 20),
                CustomTextformfield(
                  onChanged: (value) {
                   signupProvider.password = value;
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your password';
                    }
                    return null; // return null if the input is valid
                  },
            
                  labelText: passstr,
                ),
                SizedBox(height: 20),
                CustomTextformfield(
                  labelText: contactstr,
                  onChanged: (value) {
                    signupProvider.contact = value;
                  },
            
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your contact';
                    }
                    return null; // return null if the input is valid
                  },
                ),
                SizedBox(height: 20),
                CustomTextformfield(
                  onChanged: (value) {
                    signupProvider.name = value;
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your name';
                    }
                    return null; // return null if the input is valid
                  },
            
                  labelText: namestr,
                ),
            
                CustomDropdown(
                  labelText: genderstr,
                  itemlist: signupProvider.genders,
                  onChanged: (value) {
                  signupProvider.gender=value;
                  },
                  validator: (value) {
                    if (value == null) {
                      return "Please choose one choice";
                    }
                    return null;
                  },
                ),
                CustomDropdown(
                  labelText: rolestr,
                  itemlist: signupProvider.roles,
                  onChanged: (value) {
                   signupProvider.role=value;
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
                    child : signupProvider.signupStatus==ViewState.loading? CircularProgressIndicator(): Text(signupstr),
                  foregroundColor: white,
                  backgroundColor: primarycolor,
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      await signupProvider.SignupUser();
                            if (signupProvider.signupStatus == ViewState.success) {
                              displaySnackbar(context, loginsuccessstr);
                              Navigator.of(context).pushAndRemoveUntil(
                                MaterialPageRoute(
                                  builder: (context) => Login1(),
                                ),
                                (Route<dynamic> route) => false,
                              );
                            }else if(signupProvider.signupStatus==ViewState.error){
                              displaySnackbar(context, signupProvider.errorMessage?? errorMessagelable);
                            } 
                    }
                  },  
                  ) 
              ],
            ),
          ),
            ],
          );
}
