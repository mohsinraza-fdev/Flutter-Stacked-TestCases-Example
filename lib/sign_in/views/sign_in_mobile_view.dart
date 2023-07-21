import 'package:flutter/material.dart';
import 'package:flutter_stacked_testcases_example/constants/app_dimens.dart';
import 'package:flutter_stacked_testcases_example/constants/app_images.dart';
import 'package:flutter_stacked_testcases_example/constants/app_strings.dart';
import 'package:flutter_stacked_testcases_example/shared/app_text_styles.dart';
import 'package:flutter_stacked_testcases_example/shared/app_theme.dart';
import 'package:flutter_stacked_testcases_example/sign_in/view_model/repository/sign_in_repo.dart';
import 'package:flutter_stacked_testcases_example/sign_in/view_model/sign_in_view_model.dart';
import 'package:flutter_stacked_testcases_example/sign_in/view_model/usecases/sign_in_usecase.dart';
import 'package:flutter_stacked_testcases_example/widgets/app_button.dart';
import 'package:flutter_stacked_testcases_example/widgets/app_input_field.dart';
import 'package:flutter_stacked_testcases_example/widgets/auth_title.dart';
import 'package:flutter_stacked_testcases_example/widgets/base_auth_mobile_scaffold.dart';
import 'package:stacked/stacked.dart';

class SignInMobileView extends StackedView<SignInViewModel> {
  const SignInMobileView({super.key});

  @override
  Widget builder(
      BuildContext context, SignInViewModel viewModel, Widget? child) {
    return WillPopScope(
      onWillPop: () async {
        // AppNavigator.clearStackAndShow(Routes.welcomeView);
        return false;
      },
      child: BaseAuthMobileScaffold(
        // onBack: () => AppNavigator.clearStackAndShow(Routes.welcomeView),
        header: SizedBox(
          width: double.maxFinite,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: AppDimens.small),
              AuthTitle(
                text: AppStrings.signinTitle,
                horizontalMargin: AppDimens.medium,
              ),
              SizedBox(height: AppDimens.large),
            ],
          ),
        ),
        body: Align(
          alignment: Alignment.topCenter,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                AppInputField.text(
                  controller: viewModel.emailController,
                  focusNode: viewModel.emailFocus,
                  label: AppStrings.inputLabelEmail,
                  hint: AppStrings.inputPlaceholderEmail,
                  error: viewModel.emailError,
                  horizontalMargin: AppDimens.medium,
                  onChanged: (text) {
                    viewModel.validateEmailField(force: false);
                  },
                  onFocusOut: () => viewModel.validateEmailField(),
                ),
                SizedBox(height: AppDimens.medium),
                AppInputField.password(
                  controller: viewModel.passwordController,
                  focusNode: viewModel.passwordFocus,
                  label: AppStrings.inputLabelPassword,
                  hint: AppStrings.inputPlaceholderPassword,
                  error: viewModel.passwordError,
                  horizontalMargin: AppDimens.medium,
                  onChanged: (text) {
                    viewModel.validatePasswordField(force: false);
                  },
                  onFocusOut: () => viewModel.validatePasswordField(),
                ),
                SizedBox(height: AppDimens.small),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: AppDimens.medium),
                  child: GestureDetector(
                    onTap: () => viewModel.onForgotPassword(),
                    child: Text(
                      'Forgot Password',
                      style: AppTextStyles.b14(
                          context, AppTheme.colors(context).link),
                    ),
                  ),
                ),
                SizedBox(height: AppDimens.medium),
              ],
            ),
          ),
        ),
        footer: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(height: AppDimens.small),
            AppButton.primary(
              size: AppButtonSize.large,
              label: AppStrings.buttonLabelContinue,
              trailingIcon: AppImages.iconArrowForward,
              isDisabled: !viewModel.isContinueEnabled,
              isLoading: viewModel.isBusy,
              horizontalMargin: AppDimens.medium,
              onTap: () => viewModel.onContinue(),
            ),
            // AnimatedContainer(
            //   duration: const Duration(milliseconds: 80),
            //   height: isKeyboardOpen(context) ? AppDimens.medium : AppDimens.xLarge,
            // ),
          ],
        ),
      ),
    );
  }

  @override
  SignInViewModel viewModelBuilder(BuildContext context) {
    SignInRepo signInRepo = SignInRepo();
    // OtpVerificationRepo otpVerificationRepo = OtpVerificationRepo();
    // SendVerificationTokenUsecase sendVerificationTokenUsecase = SendVerificationTokenUsecase(
    //   repo: otpVerificationRepo,
    // );
    SignInUsecase signInUsecase = SignInUsecase(
      repo: signInRepo,
      // sendVerificationTokenUsecase: sendVerificationTokenUsecase,
    );
    // FetchUserDataUsecase fetchUserDataUsecase = FetchUserDataUsecase(
    //   repo: signInRepo,
    // );
    // FetchApplicantUsecase fetchApplicantUsecase = FetchApplicantUsecase(
    //   repo: signInRepo,
    // );

    return SignInViewModel(
      signInUsecase: signInUsecase,
      // fetchUserDataUsecase: fetchUserDataUsecase,
      // fetchApplicantUsecase: fetchApplicantUsecase,
    );
  }
}
