import 'package:flutter/material.dart';
import 'package:flutter_stacked_testcases_example/api_client/app_input_validator.dart';
import 'package:flutter_stacked_testcases_example/sign_in/models/auth_data_model.dart';
import 'package:flutter_stacked_testcases_example/sign_in/models/sign_in_req_model.dart';
import 'package:flutter_stacked_testcases_example/sign_in/view_model/usecases/sign_in_usecase.dart';
import 'package:stacked/stacked.dart';

class SignInViewModel extends BaseViewModel {
  SignInUsecase signInUsecase;
  // FetchUserDataUsecase fetchUserDataUsecase;
  // FetchApplicantUsecase fetchApplicantUsecase;
  SignInViewModel({
    required this.signInUsecase,
    // required this.fetchUserDataUsecase,
    // required this.fetchApplicantUsecase,
  });

  // final preferenceService = locator<PreferenceService>();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  FocusNode emailFocus = FocusNode();
  FocusNode passwordFocus = FocusNode();

  String? emailError;
  String? passwordError;

  bool get isContinueEnabled {
    return emailController.text.isNotEmpty &&
        passwordController.text.isNotEmpty;
  }

  bool validateEmailField({bool force = true}) {
    if (emailController.text.isNotEmpty && (emailError != null || force)) {
      emailError = AppInputValidator.validateEmail(emailController.text);
    }
    notifyListeners();
    return emailError == null;
  }

  bool validatePasswordField({bool force = true}) {
    if (passwordController.text.isNotEmpty && (emailError != null || force)) {
      passwordError = null;
    }
    notifyListeners();
    return passwordError == null;
  }

  onContinue() async {
    if (isBusy) return;
    setBusy(true);
    bool isFormValid = (validateEmailField() && validatePasswordField());
    if (!isFormValid) {
      setBusy(false);
      return;
    }

    AuthData? authData;
    try {
      authData = await signInUsecase.call(SignInRequestModel(
        email: emailController.text,
        password: passwordController.text,
      ));
      if (authData != null) {
        // preferenceService.setAccessToken(authData.accessToken);
        // preferenceService.setRefreshToken(authData.refreshToken);
        // preferenceService.setTokenExpiry(authData.expirationDate);
      }
    } catch (e) {
      // AppSnackbars.error(e.toString().toLocale());
    }
    if (authData == null) {
      setBusy(false);
      return;
    }

    // UserData? userData;
    // try {
    //   userData = await fetchUserDataUsecase.call();
    //   if (userData != null) {
    //     preferenceService.setUserData(userData);
    //   }
    // } catch (e) {
    //   AppSnackbars.error(e.toString().toLocale());
    // }
    // if (userData == null) {
    //   clearUserData();
    //   setBusy(false);
    //   return;
    // }

    // ApplicantData? applicantData;
    // try {
    //   applicantData = await fetchApplicantUsecase.call();
    //   if (applicantData != null) {
    //     AppNavigator.clearStackAndShow(Routes.homeView);
    //   }
    // } catch (e) {
    //   clearUserData();
    //   AppSnackbars.error(e.toString().toLocale());
    // }
    setBusy(false);
  }

  onForgotPassword() {
    // AppNavigator.navigateTo(Routes.emailInputView);
  }

  _disposeControllers() {
    emailController.dispose();
    passwordController.dispose();
  }

  _disposeFocusNodes() {
    emailFocus.dispose();
    passwordFocus.dispose();
  }

  @override
  void dispose() {
    _disposeControllers();
    _disposeFocusNodes();
    super.dispose();
  }
}
