import 'package:provider_test/core/utils/view_state.dart';

class ApiResponse {
  ViewState? state;
  String? errorMessage;
  dynamic data;
  ApiResponse({this.data,this.errorMessage,this.state});
}