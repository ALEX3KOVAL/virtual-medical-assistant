import 'dart:io';
import 'dart:convert';
import '../../entities/conclusionParamsObject.dart';
ConclusionParamsObject getConclusions(String jsonFileName) {
return ConclusionParamsObject(
(json.decode(File('assets/$jsonFileName').
readAsStringSync()) as List).
map((sublist) => ((sublist as List).
map((item) => item as double)).toList()).toList());}