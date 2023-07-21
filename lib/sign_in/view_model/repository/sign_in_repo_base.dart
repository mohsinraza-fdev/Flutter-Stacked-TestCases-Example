import 'package:flutter_stacked_testcases_example/sign_in/models/auth_data_model.dart';
import 'package:flutter_stacked_testcases_example/sign_in/models/sign_in_req_model.dart';

abstract class SignInRepoBase {
  Future<AuthData?> signIn(SignInRequestModel signinRequestModel);
}
