// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class LoginRequest {
  String username;
  String password;
  String role;

  LoginRequest({
    required this.username,
    required this.password,
    required this.role,
  });

  LoginRequest copyWith({
    String? username,
    String? password,
    String? role,
  }) {
    return LoginRequest(
      username: username ?? this.username,
      password: password ?? this.password,
      role: role ?? this.role,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'username': username,
      'password': password,
      'role': role,
    };
  }

  factory LoginRequest.fromMap(Map<String, dynamic> map) {
    return LoginRequest(
      username: map['username'] as String,
      password: map['password'] as String,
      role: map['role'] as String,
    );
  }

  Map<String, dynamic> toJson() => {
        "username": username,
        "password": password,
        "role": role,
      };

  factory LoginRequest.fromJson(String source) =>
      LoginRequest.fromMap(json.decode(source) as Map<String, dynamic>);
}
