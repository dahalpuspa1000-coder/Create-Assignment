import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_test/core/constants/app_color.dart';
import 'package:provider_test/core/constants/app_string.dart';
import 'package:provider_test/core/utils/helper.dart';
import 'package:provider_test/core/utils/view_state.dart';
import 'package:provider_test/dashboard.dart';
import 'package:provider_test/features/get_subject_createassignment.dart';
import 'package:provider_test/features/provider/login_provider.dart';
import 'package:provider_test/features/widgets/custom_elevatedbutton.dart';
import 'package:provider_test/features/widgets/custom_textformfield.dart';
class Login1 extends StatefulWidget {
  Login1({super.key});

  @override
  State<Login1> createState() => _Login1State();
}

class _Login1State extends State<Login1> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //single child scroll view.
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios),
        ),
      ),
      body: SingleChildScrollView(
        child: Consumer<LoginProvider>(
          builder: (context, loginProvider, child) => Stack(
            children: [
              LoginUI(loginProvider),
              loginProvider.loginStatus==ViewState.loading?
              backdropFilter(context)
              :SizedBox()
            ],
          ),
        ),
      ),
    );
  }

  Widget LoginUI(LoginProvider loginProvider)=>Column(
            children: [
              Form(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        loginstr,
                        style: TextStyle(
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 20),
                      Text(enterstr, style: TextStyle(fontSize: 16)),
                      SizedBox(height: 30),
                      CustomTextformfield(
                        onChanged: (value) {
                          loginProvider.email = value;
                        },
                        labelText: emailaddstr,
                      ),
                      const SizedBox(height: 30),
                      CustomTextformfield(
                        onChanged: (p0) {
                          loginProvider.password = p0;
                        },
                        suffixIcon: IconButton(
                          onPressed: () {
                            loginProvider.showpassword();
                          },
                          icon: Icon(
                            loginProvider.passwordvisibility
                                ? Icons.visibility
                                : Icons.visibility_off,
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      InkWell(
                        onTap: () {},
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                            forgotstr,
                            style: TextStyle(fontSize: 17),
                          ),
                        ),
                      ),
                      SizedBox(height: 20),

                      SizedBox(height: 50),
                      CustomElevatedbotton(
                        child: Text(loginstr),
                        foregroundColor: white,
                        backgroundColor: primarycolor,
                        onPressed: () async {
                          await loginProvider.loginUser();

                          if (loginProvider.loginStatus == ViewState.success) {
                            displaySnackbar(context, loginsuccessstr);
                            Navigator.of(context).pushAndRemoveUntil(
                              MaterialPageRoute(
                                builder: (context) =>NavBar (),
                              ),
                              (Route<dynamic> route) => false,
                            );
                          } else if (loginProvider.loginStatus ==
                              ViewState.error) {
                            displaySnackbar(
                              context,
                              loginProvider.errorMessage ?? errormessagestr,
                            );
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );


  }
