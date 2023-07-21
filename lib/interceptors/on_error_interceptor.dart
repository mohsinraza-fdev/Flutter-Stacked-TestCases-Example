import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_stacked_testcases_example/api_client/client_utils.dart';
import 'package:flutter_stacked_testcases_example/api_client/exceptions.dart';

class OnErrorInterceptor extends Interceptor {
  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    if (err.error is ClientException) {
      handler.next(err);
      return;
    }
    if (err.type == DioErrorType.connectTimeout ||
        err.type == DioErrorType.receiveTimeout ||
        err.type == DioErrorType.sendTimeout) {
      log('onErrorInterceptor - Request timed out\nEndpoint: ${err.requestOptions.path}');
      err.error = ClientException(
        message: 'connection_timed_out',
        statusCode: err.response?.statusCode ?? -1,
        responseData: err.response?.data,
      );
      handler.next(err);
      return;
    }
    if (err.type == DioErrorType.cancel) {
      log('onErrorInterceptor - Request Cancelled\nEndpoint: ${err.requestOptions.path}');
      err.error = const CancelTokenException(message: 'request_cancelled');
      handler.next(err);
      return;
    }
    if (err.type == DioErrorType.response) {
      if (err.response?.statusCode == 401 &&
          (!isResponseValid(err.response!) ||
              (isResponseValid(err.response!) &&
                  err.response!.data['errorCode'] == null))) {
        log('onErrorInterceptor - Valid Response\nEndpoint: ${err.requestOptions.path}\nStatusCode: ${err.response?.statusCode}');
        log('Access Token Expired');
        // clearUserData();
        // AppNavigator.clearStackAndShow(Routes.signInView);
        err.error = const CancelTokenException(message: 'access_token_expired');
        handler.next(err);
        return;
      }
      if (isResponseValid(err.response!)) {
        log('onErrorInterceptor - Valid Response\nEndpoint: ${err.requestOptions.path}\nStatusCode: ${err.response?.statusCode}');
        log('--> REQUEST HEADERS <--');
        logJson(err.requestOptions.headers);
        log('--> REQUEST BODY <--');
        logJson(err.requestOptions.data);
        log('--> RESPONSE <--');
        logJson(err.response?.data ?? '<null>');
        err.error = ServerException(
          errorCode: err.response?.data['errorCode'] ?? 'invalid_error_code',
          statusCode: err.response?.statusCode ?? -1,
          responseData: err.response?.data,
        );
        handler.next(err);
        return;
      }
      log('onErrorInterceptor - Invalid Response\nEndpoint: ${err.requestOptions.path}\nStatusCode: ${err.response?.statusCode}\nMessage: ${err.message}');
      log('--> REQUEST HEADERS <--');
      logJson(err.requestOptions.headers);
      log('--> REQUEST BODY <--');
      logJson(err.requestOptions.data);
      log('--> RESPONSE <--');
      logJson(err.response?.data ?? '<null>');
      err.error = ClientException(
        message: "something_went_wrong",
        statusCode: err.response?.statusCode ?? -1,
      );
      handler.next(err);
      return;
    }
    if (err.type == DioErrorType.other &&
        (err.message.contains('FormatException') ||
            err.message.contains('No host specified in URI'))) {
      log('Base url tou theek se dalo yar - ${err.message}');
      err.error = ClientException(
        message: "something_went_wrong",
        statusCode: err.response?.statusCode ?? -1,
      );
      super.onError(err, handler);
      return;
    }
    log('onErrorInterceptor - Unhandled Error -> ${err.response?.statusCode} - ${err.message}');
    err.error = ClientException(
      message: "something_went_wrong",
      statusCode: err.response?.statusCode ?? -1,
    );
    super.onError(err, handler);
  }
}
