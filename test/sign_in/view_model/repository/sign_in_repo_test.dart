import 'package:flutter_stacked_testcases_example/api_client/endpoints.dart';
import 'package:flutter_stacked_testcases_example/api_client/exceptions.dart';
import 'package:flutter_stacked_testcases_example/sign_in/models/auth_data_model.dart';
import 'package:flutter_stacked_testcases_example/sign_in/models/sign_in_req_model.dart';
import 'package:flutter_stacked_testcases_example/sign_in/view_model/repository/sign_in_repo.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../helpers/test_helpers.dart';

void main() {
  group('SignInRepoTest -', () {
    setUp(() => registerServices());
    tearDown(() => unregisterServices());

    group('signIn -', () {
      final requestModel = SignInRequestModel(email: 'xyz', password: 'xyz');

      final Map<String, dynamic> validResponse = {
        "accessToken": "test-access-token",
        "refreshToken": "",
        "expirationDate": 0,
      };

      final Map<String, dynamic> inValidResponse = {
        "accessToken": null,
        "refreshToken": null,
        "expirationDate": 0,
      };

      test('should return instance on AuthData on successful response',
          () async {
        final client = getAndRegisterApiClientDigitalHire();
        final repo = SignInRepo();

        when(client.post(
          Endpoints.signIn,
          data: requestModel.toJson(),
        )).thenAnswer((_) async => validResponse);

        expect(await repo.signIn(requestModel), const TypeMatcher<AuthData>());
      });

      test(
          'should return AuthData object with same values as the data returned on valid response',
          () async {
        final client = getAndRegisterApiClientDigitalHire();
        final repo = SignInRepo();

        when(client.post(
          Endpoints.signIn,
          data: requestModel.toJson(),
        )).thenAnswer((_) async => validResponse);

        expect((await repo.signIn(requestModel))?.toJson(), validResponse);
      });

      test('should return null on null response', () async {
        final client = getAndRegisterApiClientDigitalHire();
        final repo = SignInRepo();

        when(client.post(
          Endpoints.signIn,
          data: requestModel.toJson(),
        )).thenAnswer((_) async => null);

        expect((await repo.signIn(requestModel)), null);
      });

      test('should return ClientException if response fails to map on model',
          () async {
        final client = getAndRegisterApiClientDigitalHire();
        final repo = SignInRepo();

        when(client.post(
          Endpoints.signIn,
          data: requestModel.toJson(),
        )).thenAnswer((_) async => inValidResponse);

        expect(
          () async => await repo.signIn(requestModel),
          throwsA(const TypeMatcher<ClientException>()),
        );
      });

      test('should rethrow if client throws ServerException', () async {
        final client = getAndRegisterApiClientDigitalHire();
        final repo = SignInRepo();

        when(client.post(
          Endpoints.signIn,
          data: requestModel.toJson(),
        )).thenThrow(const ServerException(
          errorCode: 'doesnt_matter_what_it_is',
          statusCode: -1,
        ));

        expect(
          () async => await repo.signIn(requestModel),
          throwsA(const TypeMatcher<ServerException>()),
        );
      });

      test('should rethrow if client throws ClientException', () async {
        final client = getAndRegisterApiClientDigitalHire();
        final repo = SignInRepo();

        when(client.post(
          Endpoints.signIn,
          data: requestModel.toJson(),
        )).thenThrow(const ClientException(
          message: 'doesnt_matter_what_it_is',
          statusCode: -1,
        ));

        expect(
          () async => await repo.signIn(requestModel),
          throwsA(const TypeMatcher<ClientException>()),
        );
      });
    });
  });
}
