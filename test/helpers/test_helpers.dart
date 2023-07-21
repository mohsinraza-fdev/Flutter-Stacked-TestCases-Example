import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_stacked_testcases_example/api_client/api_client_xyz.dart';
import 'package:flutter_stacked_testcases_example/locator.dart';
import 'package:flutter_stacked_testcases_example/sign_in/view_model/repository/sign_in_repo.dart';
import 'package:flutter_stacked_testcases_example/sign_in/view_model/usecases/sign_in_usecase.dart';
import 'package:mockito/annotations.dart';
import 'package:stacked_services/stacked_services.dart';

import 'test_helpers.mocks.dart';

@GenerateMocks([], customMocks: [
  //App
  // MockSpec<AppNavigator>(onMissingStub: OnMissingStub.returnDefault),
  //Client
  MockSpec<Dio>(onMissingStub: OnMissingStub.returnDefault),
  MockSpec<ApiClientXYZ>(onMissingStub: OnMissingStub.returnDefault),
  MockSpec<ResponseInterceptorHandler>(
      onMissingStub: OnMissingStub.returnDefault),
  //Repo
  MockSpec<SignInRepo>(onMissingStub: OnMissingStub.returnDefault),
  //Usecase
  MockSpec<SignInUsecase>(onMissingStub: OnMissingStub.returnDefault),
  //Controllers
  MockSpec<TextEditingController>(onMissingStub: OnMissingStub.returnDefault),
  MockSpec<FocusNode>(onMissingStub: OnMissingStub.returnDefault),
  //Services
  MockSpec<NavigationService>(onMissingStub: OnMissingStub.returnDefault),
])
class TestMockGenerateables {}

ApiClientXYZ getAndRegisterApiClientDigitalHire() {
  _removeRegistrationIfExists<ApiClientXYZ>();
  final service = MockApiClientDigitalHire();
  locator.registerSingleton<ApiClientXYZ>(service);
  return service;
}

// PreferenceService getAndRegisterPreferenceService() {
//   _removeRegistrationIfExists<PreferenceService>();
//   final service = MockPreferenceService();
//   locator.registerSingleton<PreferenceService>(service);
//   return service;
// }

NavigationService getAndRegisterNavigationService() {
  _removeRegistrationIfExists<NavigationService>();
  final service = MockNavigationService();
  locator.registerSingleton<NavigationService>(service);
  return service;
}

// AnalyticsService getAndRegisterAnalyticsService() {
//   _removeRegistrationIfExists<AnalyticsService>();
//   final service = MockAnalyticsService();
//   locator.registerSingleton<AnalyticsService>(service);
//   return service;
// }

void registerServices() {
  getAndRegisterApiClientDigitalHire();
  // getAndRegisterPreferenceService();
  getAndRegisterNavigationService();
  // getAndRegisterAnalyticsService();
}

void unregisterServices() {
  locator.unregister<ApiClientXYZ>();
  // locator.unregister<PreferenceService>();
  locator.unregister<NavigationService>();
  // locator.unregister<AnalyticsService>();
}

void _removeRegistrationIfExists<T extends Object>() {
  if (locator.isRegistered<T>()) {
    locator.unregister<T>();
  }
}
