// import 'package:json_annotation/json_annotation.dart';

part 'auth_data_model.g.dart';

// @JsonSerializable()
class AuthData {
  final String accessToken;
  final String refreshToken;
  final int expirationDate;

  AuthData({
    required this.accessToken,
    required this.refreshToken,
    required this.expirationDate,
  });

  factory AuthData.fromJson(Map<String, dynamic> json) =>
      _$AuthDataFromJson(json);

  Map<String, dynamic> toJson() => _$AuthDataToJson(this);
}
