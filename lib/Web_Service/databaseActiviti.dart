import 'dart:convert';

// import 'package:mongo_dart/mongo_dart.dart'; for conect mongodb
import 'package:rvcl/models/login_response.dart';
import 'package:rvcl/models/signup_request.dart';
import 'package:http/http.dart' as http;
import '../models/login_request.dart';

class loginApi {
  // static var db, ucoll;
  // for conect mongodb
  // static connect() async {
  //   // print("object in conn");
  //   db = await Db.create(mongo_url);
  //   // print("object in conn2");

  //   await db.open();
  //   // inspect(db);
  //   // var st = db.serverStatus();
  //   // print(st);
  // }

  static Future<LoginResponse?> tryToLogin(LoginRequest lr) async {
    var res = await http.post(
        Uri.parse("https://smoggy-fawn.cyclic.app/LoginReq"),
        body: jsonEncode(lr),
        headers: {"content-type": "application/json"});
    LoginResponse? lrs = loginResponseFromJson(res.body);
    return lrs;
  }

  static Future<bool?> isUserThere(String username) async {
    var res = await http.post(
        Uri.parse("https://smoggy-fawn.cyclic.app/isUserThere"),
        body: jsonEncode({"username": username}),
        headers: {"content-type": "application/json"});

    IsUserThere? re = isUserThereFromJson(res.body);
    print(re?.isUserThere.toString());
    return re?.isUserThere;
  }

  static AddUser(SignUpRequest lr) async {
    var res = await http.post(
        Uri.parse("https://smoggy-fawn.cyclic.app/AddUser"),
        body: jsonEncode(lr.toJson()),
        headers: {"content-type": "application/json"});
  }
}
