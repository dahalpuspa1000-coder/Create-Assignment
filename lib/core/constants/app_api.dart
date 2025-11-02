import 'package:provider_test/features/home/model/login.dart';
import 'package:provider_test/features/signup.dart';
import 'package:provider_test/features/test/pages/test_pages.dart';
class AppApi {
static const baseUrl="https://myapi1-g6wb.onrender.com";
static const Firstapp="$baseUrl/createUser";
static const login1="$baseUrl/login"; 
static const getSubjects="$baseUrl/subjects/list";
static const createAssignment="$baseUrl/assignments/create"; 
static const getAssignment="$baseUrl/assignments/{assignment_id}";
}