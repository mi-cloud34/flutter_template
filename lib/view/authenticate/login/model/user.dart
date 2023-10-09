// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';
import 'package:vexana/vexana.dart';

part 'user.g.dart';

@JsonSerializable()
class UserResponseModel extends INetworkModel<UserResponseModel> {
  final User? data;
  final bool? success;
  final String? message;

  UserResponseModel({this.data, this.success, this.message});

  @override
  UserResponseModel fromJson(Map<String, dynamic> json) {
    // TODO: implement fromJson
    return _$UserResponseModelFromJson(json);
  }

  factory UserResponseModel.fromJson(Map<String, dynamic> json) {
    return _$UserResponseModelFromJson(json);
  }

  @override
  Map<String, dynamic>? toJson() {
    // TODO: implement toJson
    return _$UserResponseModelToJson(this);
  }
}

@JsonSerializable()
class User extends INetworkModel<User> {
  final int? id;
  //final String? kod;
  final int? firmano;
  final String? password;
  final bool? aktif;
  final String? ad;
  final String? token;
  final String? mail;
  

  User(
      {this.id,
      this.firmano,
      this.password,
      this.aktif,
      this.ad,
      this.mail,
      this.token
   
      });

  @override
  User fromJson(Map<String, dynamic> json) {
    return _$UserFromJson(json);
  }

  factory User.fromJson(Map<String, dynamic> json) {
    return _$UserFromJson(json);
  }
  @override
  Map<String, dynamic>? toJson() {
    return _$UserToJson(this);
  }

  factory User.fromJsonn(String source) => User.fromMap(json.decode(source));

  User copyWith({
    int? id,
    String? ad,
    String? email,
    String? password,
    String? token,
    bool? aktif,
    int? firmano,
    // final String? kod,
    String? mail,
  
  }) {
    return User(
        id: id ?? this.id,
        ad: ad ?? ad,
        mail: email ?? mail,
        password: password ?? this.password,
        aktif: aktif ?? aktif,
        token: token ?? this.token,
        firmano: firmano ?? this.firmano
        
        );
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
        id: map['id'] ?? 0,
        ad: map['ad'] ?? '',
        mail: map['mail'] ?? '',
        password: map['password'] ?? '',
        aktif: map['aktif'] ?? '',
        token: map['token'] ?? '',
        firmano: map['firmano'] ?? ''
       
        );
  }

}