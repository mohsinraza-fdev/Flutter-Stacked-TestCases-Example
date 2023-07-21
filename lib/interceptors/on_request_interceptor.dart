import 'package:dio/dio.dart';

class OnRequestInterceptor extends Interceptor {
  // final preferenceService = locator<PreferenceService>();

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    // final token = preferenceService.accessToken;
    // if (token != null) {
    //   options.headers.addAll({
    // ApiHeaders.accessToken: 'Bearer $token',
    //   });
    // }
    super.onRequest(options, handler);
  }
}
