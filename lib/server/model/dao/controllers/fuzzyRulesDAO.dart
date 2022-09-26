import '../../entities/conditionsParamsObject.dart';
import '../../entities/conclusionParamsObject.dart';
import '../readJson/loadConclusionsFromJSON.dart';
import '../readJson/loadConditionsFromJSON.dart';
import '../../entities/ruleParamsObject.dart';

class FuzzyRulesDAO {
  static Map<String, ConclusionParamsObject> __conclusionsMap = {};
  static Map<String, ConditionsParamsObject> __conditionsMap = {};
  static FuzzyRulesDAO __instance = FuzzyRulesDAO._internal();

  factory FuzzyRulesDAO() {
    return __instance;
  }

  FuzzyRulesDAO._internal();

  ConditionsParamsObject __readConditionsFromJSON (String conditionsJSONFileName) {
    if (!__conditionsMap.containsKey(conditionsJSONFileName)) {
      __conditionsMap[conditionsJSONFileName] = getConditions(conditionsJSONFileName);
    }
    return __conditionsMap[conditionsJSONFileName]!;
  }

  ConclusionParamsObject __readConclusionsFromJSON(String conclusionsJSONFileName) {
    if (!__conclusionsMap.containsKey(conclusionsJSONFileName)) {
      __conclusionsMap[conclusionsJSONFileName] = getConclusions(conclusionsJSONFileName);
    }
    return __conclusionsMap[conclusionsJSONFileName]!;
  }

  RuleParamsObject getRuleParamsObject(String conditionsJSONFileName, String conclusionJSONFileName) {
    return RuleParamsObject(__readConditionsFromJSON(conditionsJSONFileName), __readConclusionsFromJSON(conclusionJSONFileName));
  }
}