// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class LoginRequest {
  String username;
  String password;

  LoginRequest({
    required this.username,
    required this.password,
  });

  LoginRequest copyWith({
    String? username,
    String? password,
  }) {
    return LoginRequest(
      username: username ?? this.username,
      password: password ?? this.password,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'username': username,
      'password': password,
    };
  }

  factory LoginRequest.fromMap(Map<String, dynamic> map) {
    return LoginRequest(
      username: map['username'] as String,
      password: map['password'] as String,
    );
  }

  Map<String, dynamic> toJson() => {
        "username": username,
        "password": password,
      };

  factory LoginRequest.fromJson(String source) =>
      LoginRequest.fromMap(json.decode(source) as Map<String, dynamic>);
}

// To parse this JSON data, do
//
//     final isUserThere = isUserThereFromJson(jsonString);

IsUserThere? isUserThereFromJson(String str) =>
    IsUserThere.fromJson(json.decode(str));

String isUserThereToJson(IsUserThere? data) => json.encode(data!.toJson());

class IsUserThere {
  IsUserThere({
    this.isUserThere,
    this.message,
  });

  bool? isUserThere;
  String? message;

  factory IsUserThere.fromJson(Map<String, dynamic> json) => IsUserThere(
        isUserThere: json["isUserThere"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "isUserThere": isUserThere,
        "message": message,
      };
}
