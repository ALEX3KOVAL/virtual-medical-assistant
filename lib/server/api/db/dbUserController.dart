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
      print("Подключение к бд не установилось!!");
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
      print("lllllll");
      dynamic body = json.decode(query);
      print(body["userName"]);
      String sql = 'INSERT INTO users SET userName="${body["userName"]}", email="${body["email"]}", phoneNumber=${body["phoneNumber"]}, password="${body["password"]}"';
      print(sql);
      print("mmmmmm");
      await __connection.execute(sql);
      print("vvvvvvvvvv");
    }
    catch(e) {
      print(e);
      throw Error();
    }
  }

  Future<String> get(String fieldName, dynamic fieldValue) async {
    try {
      String sql = 'SELECT password FROM users WHERE ${fieldName} = :$fieldValue';
      IResultSet result = await __connection.execute(sql, {fieldName: fieldValue});
      result.rows.first.assoc()["password"]
    }
    catch(e) {
      return "";
    }
  }

  Future<String> getAll() async {
    //String sql = "SELECT ";
    //Map<String, List<String>> resultArray = <String, List<String>>{};
    //for (String field in selectedFields) {
    // resultArray[field] = [];
    //}
    //selectedFields.forEach((element) => sql += element + ",");
    //sql = sql.substring(0, sql.length);
    //sql += "FROM users";
    String sql = 'SELECT userName, email, phoneNumber, password FROM users';
    IResultSet result = await __connection.execute(sql);
    return (result.rows.map((e) => e.assoc().toString())).toString();
  }

  Future<void> delete(Request req) async {
    try {
      String query = await req.readAsString();
      print("lllllll");
      Map<String, dynamic> body = json.decode(query);
      String sql = 'DELETE FROM users WHERE ${body.keys.first} = :${body.keys.first}';
      await __connection.execute(sql, body);
    }
    catch(e) {
      print(e);
      throw Error();
    }
  }

  bool set(int id) {
    return true;
  }
}



class DBUserController {
  static late MySQLConnection __connection;
  static late DBUserController __instance;
  static bool isInit = false;

  static Future<DBUserController> init({String dbName = "mds", String host = "localhost", int port = 3306, String user = "root", String password = ""}) async {
    try {
      if (!isInit) {
        ConnectionSettings settings = ConnectionSettings(
            port: port,
            db: dbName,
            password: password,
            host: host,
            user: user
        );
        __connection = await MySqlConnection.connect(settings);
        __instance = DBUserController();
        isInit = true;
      }
      return __instance;
    }
    catch (e) {
      print("Подключение к бд не установилось!!");
      __instance = DBUserController();
      return __instance;
    }
  }

  static DBUserController get instance {
    return __instance;
  }

  Future<bool> add(Map<String, String> usersData) async {
    return true;
  }

  Future<Map<String, String>> get(List<String> selectedFields, String whereFieldName, dynamic whereFieldValue) async {
    String sql = "SELECT ";
    Map<String, String> resultObject = <String, String>{};
    for (String element in selectedFields) {
      sql += "$element,";
    }
    sql += "FROM users WHERE $whereFieldName = $whereFieldValue";
    Results result = await __connection.query(sql);
    for (int index = 0, length = selectedFields.length; index < length; index++) {
      resultObject[selectedFields[index]] = result.elementAt(0).elementAt(index);
    }
    return resultObject;
  }

  Future<Map<String, List<String>>> getAll(List<String> selectedFields) async {
    String sql = "SELECT ";
    Map<String, List<String>> resultArray = Map<String, List<String>>();
    for (String field in selectedFields) {
      resultArray[field] = [];
    }
    selectedFields.forEach((element) => sql += "$element,");
    sql = sql.substring(0, sql.length);
    sql += "FROM users";
    Results result = await __connection.query(sql);
    for (int rowIndex = 0, rowsCount = result.length; rowIndex < rowsCount; rowIndex++) {
      for (int columnIndex = 0, columnsCount = selectedFields.length; columnIndex < columnsCount; columnIndex++) {
        resultArray[selectedFields[columnIndex]]?.add(result.elementAt(rowIndex).elementAt(columnIndex));
      }
    }
    return resultArray;
  }

  Future<bool> delete(String fieldName, dynamic fieldValue) async {
    try {
      String sql = "DELETE FROM users WHERE $fieldName = $fieldValue";
      await __connection.query(sql);
      return true;
    }
    catch(e) {
      print(e);
      return false;
    }
  }

  bool set(int id) {
    return true;
  }
}