// ignore_for_file: public_member_api_docs, lines_longer_than_80_chars
//ignore_for_file: argument_type_not_assignable

import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable()
class UserModel {
  UserModel({
    required this.uuid,
    required this.name,
    required this.email,
    required this.password,
  });

  final String uuid;
  final String name;
  final String email;
  final String password;

  factory UserModel.fromJson(Map<String, dynamic> json) {
    // final _user = json['user'] as Map<String, dynamic>;
    return UserModel(
      email: json['email'],
      uuid: json['uuid'],
      name: json['name'],
      password: json['password'],
    );
  }

  Map<String, dynamic> toJson() => _$UserModelToJson(this);

  // toJson() => {
  //       'uuid': uuid,
  //       'name': name,
  //       'email': email,
  //       'password': password,
  //     };
}
