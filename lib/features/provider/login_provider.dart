import 'package:flutter/material.dart';
import 'package:provider_test/core/constants/app_api.dart';
import 'package:provider_test/core/services/api_service.dart';
import 'package:provider_test/core/utils/api_response.dart';
import 'package:provider_test/core/utils/view_state.dart';
import 'package:provider_test/features/home/model/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginProvider extends ChangeNotifier{
  String? email,password;
  ViewState loginStatus=ViewState.idle;
  String? errorMessage;
  ApiService service=ApiService();
  setLoginState(ViewState value){
    loginStatus=value;
    notifyListeners();
  }
  Future<void> loginUser() async{
    setLoginState(ViewState.loading);
    Login login=Login(email:email,password:password,deviceToken:"hi");
   ApiResponse response=await service.post(
      AppApi.login1,
      data: login.toJson(),
    );
    if (response.state==ViewState.success){
      
      String? token = response.data['data']['token'];
      final SharedPreferences prefs=await SharedPreferences.getInstance();
      await prefs.setString('auth_token',token!);
      setLoginState(ViewState.success);
    }
    else if (response.state ==ViewState.error){
      errorMessage=response.errorMessage;
      setLoginState(ViewState.error);
    }
  }

  bool passwordvisibility=false;
  showpassword(){
  if(passwordvisibility){
    passwordvisibility=false;
  }
  else{
    passwordvisibility=true;
  }
  notifyListeners();
}

}
//re[data]