import 'package:flutter_stacked_testcases_example/api_client/exceptions.dart';
import 'package:flutter_stacked_testcases_example/sign_in/models/auth_data_model.dart';
import 'package:flutter_stacked_testcases_example/sign_in/models/sign_in_req_model.dart';
import 'package:flutter_stacked_testcases_example/sign_in/view_model/usecases/sign_in_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../helpers/test_helpers.dart';
import '../../../helpers/test_helpers.mocks.dart';

void main() {
  group('SignInUsecaseTest -', () {
    setUp(() => registerServices());
    tearDown(() => unregisterServices());

    group('call -', () {
      final requestModel = SignInRequestModel(email: 'xyz', password: 'xyz');

      final AuthData responseModel = AuthData.fromJson({
        "accessToken": "test-access-token",
        "refreshToken": "",
        "expirationDate": 0,
      });

      test('should return null if repo returns null', () async {
        final repo = MockSignInRepo();
        // final OtpVerificationRepo otpVerificationRepo = OtpVerificationRepo();
        // final SendVerificationTokenUsecase sendVerificationTokenUsecase = SendVerificationTokenUsecase(repo: otpVerificationRepo);
        final usecase = SignInUsecase(repo: repo);
        when(repo.signIn(requestModel)).thenAnswer((_) async => null);

        expect(await usecase.call(requestModel), null);
      });

      test('should return AuthData object if repo returns AuthData object',
          () async {
        final repo = MockSignInRepo();
        final usecase = SignInUsecase(repo: repo);
        when(repo.signIn(requestModel)).thenAnswer((_) async => responseModel);

        expect(await usecase.call(requestModel), const TypeMatcher<AuthData>());
      });

      test(
          'should return AuthData object with same valus as the one returned from repo',
          () async {
        final repo = MockSignInRepo();
        final usecase = SignInUsecase(repo: repo);
        when(repo.signIn(requestModel)).thenAnswer((_) async => responseModel);

        expect((await usecase.call(requestModel))?.toJson(),
            responseModel.toJson());
      });

      test('should rethrow error code if repo.signIn throws ServerException',
          () async {
        final repo = MockSignInRepo();
        final usecase = SignInUsecase(repo: repo);
        when(repo.signIn(requestModel)).thenThrow(
            const ServerException(errorCode: "x_y_z", statusCode: -1));
        dynamic exception;
        try {
          await usecase.call(requestModel);
        } catch (e) {
          exception = e;
        }

        expect(exception, "x_y_z");
      });

      test(
          'should throw message from client exception if repo.signIn throws ClientException',
          () async {
        final repo = MockSignInRepo();
        final usecase = SignInUsecase(repo: repo);
        when(repo.signIn(requestModel)).thenThrow(const ClientException(
            message: "some error message", statusCode: -1));
        dynamic exception;
        try {
          await usecase.call(requestModel);
        } catch (e) {
          exception = e;
        }

        expect(exception, "some error message");
      });

      test('should throw Exception as String if repo.signIn throws a String',
          () async {
        final repo = MockSignInRepo();
        final usecase = SignInUsecase(repo: repo);
        when(repo.signIn(requestModel)).thenThrow('unknown exception type');
        dynamic exception;
        try {
          await usecase.call(requestModel);
        } catch (e) {
          exception = e;
        }

        expect(exception, 'unknown exception type');
      });

      test('should throw Exception as String if repo.signIn throws an int',
          () async {
        final repo = MockSignInRepo();
        final usecase = SignInUsecase(repo: repo);
        when(repo.signIn(requestModel)).thenThrow(12345);
        dynamic exception;
        try {
          await usecase.call(requestModel);
        } catch (e) {
          exception = e;
        }

        expect(exception, '12345');
      });

      test(
          'should throw Exception as String if repo.signIn throws an unknown Object',
          () async {
        final repo = MockSignInRepo();
        final usecase = SignInUsecase(repo: repo);
        const unknownExceptionObject =
            CancelTokenException(message: 'doesnt matter what it is');
        when(repo.signIn(requestModel)).thenThrow(unknownExceptionObject);
        dynamic exception;
        try {
          await usecase.call(requestModel);
        } catch (e) {
          exception = e;
        }

        expect(exception, unknownExceptionObject.toString());
      });
    });
  });
}
