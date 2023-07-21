import 'package:flutter_stacked_testcases_example/api_client/api_client_xyz.dart';
import 'package:flutter_stacked_testcases_example/api_client/client_utils.dart';
import 'package:flutter_stacked_testcases_example/api_client/endpoints.dart';
import 'package:flutter_stacked_testcases_example/locator.dart';
import 'package:flutter_stacked_testcases_example/sign_in/models/auth_data_model.dart';
import 'package:flutter_stacked_testcases_example/sign_in/models/sign_in_req_model.dart';
import 'package:flutter_stacked_testcases_example/sign_in/view_model/repository/sign_in_repo_base.dart';

class SignInRepo implements SignInRepoBase {
  final client = locator<ApiClientXYZ>();
  @override
  Future<AuthData?> signIn(SignInRequestModel signInRequestModel) async {
    try {
      Map<String, dynamic>? resp = await client.post<Map<String, dynamic>>(
        Endpoints.signIn,
        data: signInRequestModel.toJson(),
      );
      if (resp == null) {
        return null;
      }
      return parseModel<AuthData>(() => AuthData.fromJson(resp));
    } catch (e) {
      rethrow;
    }
  }
}
