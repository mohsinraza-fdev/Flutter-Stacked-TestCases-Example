import 'package:dio/dio.dart';
import 'package:flutter_stacked_testcases_example/api_client/api_client_xyz.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';

final locator = StackedLocator.instance;

void setupLocator() {
  locator.registerLazySingleton(() => NavigationService());
  locator.registerLazySingleton(() => ApiClientXYZ(Dio()));
}

void clearLocator() {}

void clearUserData() {
  clearLocator();
}
