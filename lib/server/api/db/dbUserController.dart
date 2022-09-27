import 'dart:convert';
import 'package:shelf/shelf.dart';
import 'package:mysql_client/mysql_client.dart';

class DBUserController {
  static late MySQLConnection __connection;
  static late DBUserController __instance;
  static bool __isInit = false;

  static Future<DBUserController> init({
    required dynamic dbName,
    required dynamic host,
    required dynamic port,
    required dynamic user,
    required dynamic password}) async {
    try {
      if (!__isInit) {
        __connection = await MySQLConnection.createConnection(
            port: port,
            databaseName: dbName,
            password: password,
            host: host,
            userName: user);
        await __connection.connect();
        __instance = DBUserController();
        __isInit = true;
      }
      return __instance;
    }
    catch (e) {
      __instance = DBUserController();
      return __instance;
    }
  }

  static DBUserController get instance {
    return __instance;
  }

  Future<void> add(Request req) async {
    try {
      String query = await req.readAsString();
      dynamic body = json.decode(query);
      String sql = 'INSERT INTO users SET userName="${body["userName"]}", email="${body["email"]}", phoneNumber=${body["phoneNumber"]}, password="${body["password"]}"';
      await __connection.execute(sql);
    }
    catch(e) {
      throw Error();
    }
  }

  Future<String> get(String fieldName, dynamic fieldValue) async {
    try {
      String sql = 'SELECT password FROM users WHERE $fieldName = :$fieldName';
      IResultSet result = await __connection.execute(sql, {fieldName: fieldValue});
      return {"password" : (result.rows.first.assoc()["password"]).toString()}.toString();
    }
    catch(e) {
      throw Error();
    }
  }

  Future<String> getAll() async {
    String sql = 'SELECT userName, email, phoneNumber, password FROM users';
    IResultSet result = await __connection.execute(sql);
    return (result.rows.map((e) => e.assoc().toString())).toString();
  }

  Future<void> delete(Request req) async {
    try {
      String query = await req.readAsString();
      Map<String, dynamic> body = json.decode(query);
      String sql = 'DELETE FROM users WHERE ${body.keys.first} = :${body.keys.first}';
      await __connection.execute(sql, body);
    }
    catch(e) {
      throw Error();
    }
  }

  bool set(int id) {
    return true;
  }
}