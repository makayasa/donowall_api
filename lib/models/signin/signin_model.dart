// ignore_for_file: public_member_api_docs, lines_longer_than_80_chars
//ignore_for_file: argument_type_not_assignable

import 'package:json_annotation/json_annotation.dart';

part 'signin_model.g.dart';

@JsonSerializable()
class SigninModel {
  SigninModel({
    required this.email,
    required this.password,
  });
  final String email;
  final String password;

  factory SigninModel.fromJson(Map<String, dynamic> json) => SigninModel(
        email: json['email'],
        password: json['password'],
      ); 

  Map<String, dynamic> toJson() => _$SigninModelToJson(this);
}
