class ClientException implements Exception {
  final String message;
  final int statusCode;
  final Map<String, dynamic>? responseData;

  const ClientException({
    required this.message,
    required this.statusCode,
    this.responseData,
  });
}

class ServerException implements Exception {
  final String errorCode;
  final int statusCode;
  final Map<String, dynamic>? responseData;

  const ServerException({
    required this.errorCode,
    required this.statusCode,
    this.responseData,
  });
}

class CancelTokenException implements Exception {
  final String message;

  const CancelTokenException({
    required this.message,
  });
}
