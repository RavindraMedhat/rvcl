import 'dart:convert';

LoginResponse? loginResponseFromJson(String str) => LoginResponse.fromJson(json.decode(str));

String loginResponseToJson(LoginResponse? data) => json.encode(data!.toJson());

class LoginResponse {
    LoginResponse({
        this.success,
        this.role,
    });

    bool? success;
    String? role;

    factory LoginResponse.fromJson(Map<String, dynamic> json) => LoginResponse(
        success: json["success"],
        role: json["role"],
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "role": role,
    };
}
