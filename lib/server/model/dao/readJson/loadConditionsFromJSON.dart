import 'dart:io';
import 'dart:convert';
import '../../entities/conditionsParamsObject.dart';

ConditionsParamsObject getConditions(String jsonFileName) {
  return ConditionsParamsObject(
    (json.decode(File('assets/$jsonFileName').readAsStringSync()) as Map).
    map((key, value) => MapEntry(key, ((value as List).
    map((itemList) => ((itemList as List<dynamic>).
    map((item) => double.parse(item.toString()))).toList())).toList()))
  );
}