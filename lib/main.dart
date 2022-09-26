// @dart=2.9
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:medical_dialogue_system/server/api/db/dbUserController.dart';
import './client/widgets/screens/splashScreen/splashScreen.dart';
import "./client/routes/routes.dart";
import "./server/dbConnectParams.dart";

void main() async {
  await DBUserController.init(
    dbName: dbConnectParams["dbName"],
    password: dbConnectParams["password"],
    port: dbConnectParams["port"],
    host: dbConnectParams["host"],
    user: dbConnectParams["user"]);
  runApp(myApp);
}

MaterialApp myApp = const MaterialApp(
  home: SplashScreen()
);








