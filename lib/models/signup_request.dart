// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class SignUpRequest {
  String username;
  String password;
  String role;

  SignUpRequest({
    required this.username,
    required this.password,
    required this.role,
  });

  SignUpRequest copyWith({
    String? username,
    String? password,
    String? role,
  }) {
    return SignUpRequest(
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

  factory SignUpRequest.fromMap(Map<String, dynamic> map) {
    return SignUpRequest(
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

  factory SignUpRequest.fromJson(String source) =>
      SignUpRequest.fromMap(json.decode(source) as Map<String, dynamic>);
}
