import 'package:flutter_stacked_testcases_example/sign_in/view_model/sign_in_view_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../helpers/test_helpers.dart';
import '../../helpers/test_helpers.mocks.dart';

void main() {
  group('SigninViewModelTest -', () {
    setUp(() => registerServices());
    tearDown(() => unregisterServices());

    group('isContinueEnabled -', () {
      test('should return false if password controller is empty', () async {
        final signInUsecase = MockSignInUsecase();
        // final fetchUserDataUsecase = MockFetchUserDataUsecase();
        // final fetchApplicantUsecase = MockFetchApplicantUsecase();
        final viewModel = SignInViewModel(
          signInUsecase: signInUsecase,
          // fetchUserDataUsecase: fetchUserDataUsecase,
          // fetchApplicantUsecase: fetchApplicantUsecase,
        );
        viewModel.emailController.text = 'abcd';
        viewModel.passwordController.text = '';
        expect(viewModel.isContinueEnabled, false);
      });

      test('should return false if email controller is empty', () async {
        final signInUsecase = MockSignInUsecase();

        final viewModel = SignInViewModel(
          signInUsecase: signInUsecase,
        );
        viewModel.emailController.text = '';
        viewModel.passwordController.text = 'asdfas';
        expect(viewModel.isContinueEnabled, false);
      });

      test('should return false if all controllers are empty', () async {
        final signInUsecase = MockSignInUsecase();

        final viewModel = SignInViewModel(
          signInUsecase: signInUsecase,
        );
        viewModel.emailController.text = '';
        viewModel.passwordController.text = '';
        expect(viewModel.isContinueEnabled, false);
      });

      test('should return true if all controllers are not empty', () async {
        final signInUsecase = MockSignInUsecase();

        final viewModel = SignInViewModel(
          signInUsecase: signInUsecase,
        );
        viewModel.emailController.text = 'asd';
        viewModel.passwordController.text = 'asd';
        expect(viewModel.isContinueEnabled, true);
      });
    });

    group('validateEmailField -', () {
      const validEmail = 'abc@abc.com';
      const inValidEmail = 'abc@abc.c';

      test('should return true on valid email', () {
        final signInUsecase = MockSignInUsecase();

        final viewModel = SignInViewModel(
          signInUsecase: signInUsecase,
        );
        viewModel.emailError = null;
        viewModel.emailController.text = validEmail;
        expect(viewModel.validateEmailField(), true);
      });

      test('should return false on inValid email', () {
        final signInUsecase = MockSignInUsecase();

        final viewModel = SignInViewModel(
          signInUsecase: signInUsecase,
        );
        viewModel.emailError = null;
        viewModel.emailController.text = inValidEmail;
        expect(viewModel.validateEmailField(), false);
      });

      test(
          'should set emailError to null on valid email if emailError was null',
          () {
        final signInUsecase = MockSignInUsecase();

        final viewModel = SignInViewModel(
          signInUsecase: signInUsecase,
        );
        viewModel.emailError = null;
        viewModel.emailController.text = validEmail;
        viewModel.validateEmailField();
        expect(viewModel.emailError, null);
      });

      test(
          'should set emailError to null on valid email if emailError already had error',
          () {
        final signInUsecase = MockSignInUsecase();

        final viewModel = SignInViewModel(
          signInUsecase: signInUsecase,
        );
        viewModel.emailError = 'error';
        viewModel.emailController.text = validEmail;
        viewModel.validateEmailField();
        expect(viewModel.emailError, null);
      });

      test('should set emailError to String on inValidEmail', () {
        final signInUsecase = MockSignInUsecase();

        final viewModel = SignInViewModel(
          signInUsecase: signInUsecase,
        );
        viewModel.emailError = null;
        viewModel.emailController.text = inValidEmail;
        viewModel.validateEmailField();
        expect(viewModel.emailError.runtimeType, ''.runtimeType);
      });

      test(
          'should set emailError to null on validEmail if emailError was String and force flag was false',
          () {
        final signInUsecase = MockSignInUsecase();

        final viewModel = SignInViewModel(
          signInUsecase: signInUsecase,
        );
        viewModel.emailError = 'error';
        viewModel.emailController.text = validEmail;
        viewModel.validateEmailField(force: false);
        expect(viewModel.emailError, null);
      });

      test(
          'should keep emailError to null on inValidEmail if emailError was null and force flag was false',
          () {
        final signInUsecase = MockSignInUsecase();

        final viewModel = SignInViewModel(
          signInUsecase: signInUsecase,
        );
        viewModel.emailError = null;
        viewModel.emailController.text = inValidEmail;
        viewModel.validateEmailField(force: false);
        expect(viewModel.emailError, null);
      });

      test(
          'should keep emailError to String on inValidEmail if emailError was String and force flag was false',
          () {
        final signInUsecase = MockSignInUsecase();

        final viewModel = SignInViewModel(
          signInUsecase: signInUsecase,
        );
        viewModel.emailError = 'error';
        viewModel.emailController.text = inValidEmail;
        viewModel.validateEmailField(force: false);
        expect(viewModel.emailError.runtimeType, ''.runtimeType);
      });
    });

    group('validatePasswordField -', () {
      const password = 'abcd1234';
      test('should return true whatever the password is', () {
        final signInUsecase = MockSignInUsecase();

        final viewModel = SignInViewModel(
          signInUsecase: signInUsecase,
        );
        viewModel.passwordController.text = password;
        viewModel.validatePasswordField();
        expect(viewModel.validatePasswordField(), true);
      });

      test('passwordError should be null on any password case', () {
        final signInUsecase = MockSignInUsecase();

        final viewModel = SignInViewModel(
          signInUsecase: signInUsecase,
        );
        viewModel.passwordController.text = password;
        viewModel.validatePasswordField();
        expect(viewModel.passwordError, null);
      });

      test(
          'passwordError should be null on any password case if force flag is false',
          () {
        final signInUsecase = MockSignInUsecase();

        final viewModel = SignInViewModel(
          signInUsecase: signInUsecase,
        );
        viewModel.passwordController.text = password;
        viewModel.validatePasswordField(force: false);
        expect(viewModel.passwordError, null);
      });
    });

    group('dispose -', () {
      test('should dispose email controller when called', () {
        final signInUsecase = MockSignInUsecase();

        final viewModel = SignInViewModel(
          signInUsecase: signInUsecase,
        );
        viewModel.emailController = MockTextEditingController();
        viewModel.dispose();
        verify(viewModel.emailController.dispose()).called(1);
      });

      test('should dispose password controller when called', () {
        final signInUsecase = MockSignInUsecase();

        final viewModel = SignInViewModel(
          signInUsecase: signInUsecase,
        );
        viewModel.passwordController = MockTextEditingController();
        viewModel.dispose();
        verify(viewModel.passwordController.dispose()).called(1);
      });

      test('should dispose email focus node when called', () {
        final signInUsecase = MockSignInUsecase();

        final viewModel = SignInViewModel(
          signInUsecase: signInUsecase,
        );
        viewModel.emailFocus = MockFocusNode();
        viewModel.dispose();
        verify(viewModel.emailFocus.dispose()).called(1);
      });

      test('should dispose password focus node when called', () {
        final signInUsecase = MockSignInUsecase();

        final viewModel = SignInViewModel(
          signInUsecase: signInUsecase,
        );
        viewModel.passwordFocus = MockFocusNode();
        viewModel.dispose();
        verify(viewModel.passwordFocus.dispose()).called(1);
      });
    });
  });
}
