import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stacked_testcases_example/api_client/client_utils.dart';
import 'package:flutter_stacked_testcases_example/interceptors/on_error_interceptor.dart';
import 'package:flutter_stacked_testcases_example/interceptors/on_request_interceptor.dart';
import 'package:flutter_stacked_testcases_example/interceptors/on_response_interceptor.dart';

abstract class ApiClientBase {
  String get baseUrl;
  int get defaultConnectTimeout;
  int get defaultReceiveTimeout;

  @protected
  final Dio client;
  ApiClientBase(this.client);

  void initialise() {
    client.options
      ..baseUrl = baseUrl
      ..validateStatus = isStatusCodeValid
      ..connectTimeout = defaultConnectTimeout
      ..receiveTimeout = defaultReceiveTimeout;
    client.interceptors.addAll([
      OnRequestInterceptor(),
      OnResponseInterceptor(),
      OnErrorInterceptor(),
    ]);
  }

  @protected
  Future<T?> get<T>(
    String endpoint, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
  });

  @protected
  Future<T?> post<T>(
    String endpoint, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
  });

  @protected
  Future<T?> delete<T>(
    String endpoint, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
  });
}
