import 'dart:developer';

import 'package:mongo_dart/mongo_dart.dart';
import 'package:rvcl/DataBase/batabaseString.dart';

import 'login_request.dart';

class mongoDataBase {
  static var db, ucoll;

  static connect() async {
    // print("object in conn");
    db = await Db.create(mongo_url);
    // print("object in conn2");

    await db.open();
    // inspect(db);
    // var st = db.serverStatus();
    // print(st);
  }

  static Future<List<Map<String, dynamic>>> tryToLogin(LoginRequest lr) async {
    ucoll = db.collection(MongoCollections.user);
    final arrayData =
        await ucoll.find(where.eq("username", lr.username)).toList();
    return arrayData;
  }

  static Future<bool> isUserThere(String username) async {
    ucoll = db.collection(MongoCollections.user);
    final arrayData = await ucoll.find(where.eq("username", username)).toList();
    if (arrayData.length == 0) {
      return false;
    } else {
      return true;
    }
  }

  static AddUser(LoginRequest lr) async {
    ucoll = db.collection(MongoCollections.user);
    await ucoll.insertOne(lr.toJson());
  }
  
}
