import 'package:flutter_stacked_testcases_example/api_client/api_client.dart';
import 'package:flutter_stacked_testcases_example/api_client/endpoints.dart';

class ApiClientXYZ extends ApiClient {
  ApiClientXYZ(super.client);

  @override
  String get baseUrl => Endpoints.baseUrl;

  @override
  int get defaultConnectTimeout => const Duration(seconds: 20).inMilliseconds;

  @override
  int get defaultReceiveTimeout => const Duration(seconds: 20).inMilliseconds;
}
