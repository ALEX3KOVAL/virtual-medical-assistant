import 'dart:io';

import 'package:mysql1/mysql1.dart';

class DBUserController {
  static late MySqlConnection __connection;
  static late DBUserController __instance;
  static bool isInit = false;

  static Future<DBUserController> instance({String dbName = "mds", String host = "localhost", int port = 3306, String user = "root", String password = ""}) async {
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
      }
      return __instance;
    }
    catch (e) {
      print("Подключение к бд не установилось!!");
      __instance = DBUserController();
      return __instance;
    }
  }

  Future<bool> add(Map<String, String> usersData) async {
    return true;
  }

  Future<Map<String, String>> get(List<String> selectedFields, String whereFieldName, dynamic whereFieldValue) async {
    String sql = "SELECT ";
    Map<String, String> resultObject = Map<String, String>();
    selectedFields.forEach((element) => sql += element + ",");
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
    selectedFields.forEach((element) => sql += element + ",");
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