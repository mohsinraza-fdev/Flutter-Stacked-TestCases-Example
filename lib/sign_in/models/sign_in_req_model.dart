// import 'package:json_annotation/json_annotation.dart';
part 'sign_in_req_model.g.dart';

// @JsonSerializable()
class SignInRequestModel {
  final String email;
  final String password;

  SignInRequestModel({
    required this.email,
    required this.password,
  });

  factory SignInRequestModel.fromJson(Map<String, dynamic> json) =>
      _$SignInRequestModelFromJson(json);

  Map<String, dynamic> toJson() => _$SignInRequestModelToJson(this);
}
