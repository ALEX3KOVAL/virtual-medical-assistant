import 'conclusionParamsObject.dart';
import 'conditionsParamsObject.dart';

class RuleParamsObject {
  late ConditionsParamsObject __conditionsParamsObject;
  late ConclusionParamsObject __conclusionParamsObject;

  RuleParamsObject(ConditionsParamsObject conditionsParamsObject, ConclusionParamsObject conclusionParamsObject) {
    __conditionsParamsObject = conditionsParamsObject;
    __conclusionParamsObject = conclusionParamsObject;
  }

  ConditionsParamsObject get conditionsParamsObject => __conditionsParamsObject;

  ConclusionParamsObject get conclusionParamsObject => __conclusionParamsObject;

  int get countOfMycoFunctions => __conditionsParamsObject.mycoConditionsValues.length;

  int get countOfTempeFunctions => __conditionsParamsObject.tempeConditionsValues.length;

  int get countOfLimphoFunctions => __conditionsParamsObject.limphoConditionsValues.length;

  int get countOfLeukoFunctions => __conditionsParamsObject.leukoConditionsValues.length;
}