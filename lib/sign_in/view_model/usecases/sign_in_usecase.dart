import 'package:flutter_stacked_testcases_example/api_client/exceptions.dart';
import 'package:flutter_stacked_testcases_example/sign_in/models/auth_data_model.dart';
import 'package:flutter_stacked_testcases_example/sign_in/models/sign_in_req_model.dart';
import 'package:flutter_stacked_testcases_example/sign_in/view_model/repository/sign_in_repo.dart';

class SignInUsecase {
  SignInRepo repo;
  // SendVerificationTokenUsecase sendVerificationTokenUsecase;
  SignInUsecase({
    required this.repo,
    // required this.sendVerificationTokenUsecase,
  });

  Future<AuthData?> call(SignInRequestModel signInRequestModel) async {
    try {
      return await repo.signIn(signInRequestModel);
    } on ServerException catch (e) {
      // if (e.errorCode == 'user_not_verified') {
      //   try {
      //     await sendVerificationTokenUsecase.call(
      //       SendVerificationTokenReqModel(email: signInRequestModel.email),
      //     );
      //   } catch (e) {
      //     rethrow;
      //   }
      //   AppNavigator.navigateTo(
      //     Routes.otpVerificationView,
      //     arguments: OtpVerificationViewArguments(email: signInRequestModel.email),
      //   );
      //   return null;
      // }
      throw (e.errorCode);
    } on ClientException catch (e) {
      throw (e.message);
    } catch (e) {
      throw (e.toString());
    }
  }
}
