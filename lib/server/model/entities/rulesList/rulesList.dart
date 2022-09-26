import '../../dao/controllers/fuzzyRulesDAO.dart';
import '../../functions/mfs/functions.dart';
import '../../functions/mfs/mfInterface.dart';
import '../ruleParamsObject.dart';
import 'rule.dart';

class RulesList {
  late List<Rule> __rulesList = [];
  static late RuleParamsObject __ruleParamsObject;
  static late String __conditionsJSONFileName, __conclusionsJSONFileName;
  static final RulesList __instance = RulesList._internal();

  factory RulesList({String conditionsJSONFileName = "", String conclusionsJSONFileName = ""}) {
    __conditionsJSONFileName = conditionsJSONFileName;
    __conclusionsJSONFileName = conclusionsJSONFileName;
    return __instance;
  }

  RulesList._internal() {
    __ruleParamsObject = FuzzyRulesDAO().getRuleParamsObject(__conditionsJSONFileName, __conclusionsJSONFileName);
    List<Map<int, IMembershipFunction>> map = [
      {
        0 : LowMembershipFunction(__ruleParamsObject.conditionsParamsObject.mycoConditionsValues[0]),
        1: HighMembershipFunction(__ruleParamsObject.conditionsParamsObject.mycoConditionsValues[1])
      },
      {
        0: LowMembershipFunction(__ruleParamsObject.conditionsParamsObject.tempeConditionsValues[0]),
        1: GaussianMembershipFunction(__ruleParamsObject.conditionsParamsObject.tempeConditionsValues[1]),
        2: HighMembershipFunction(__ruleParamsObject.conditionsParamsObject.tempeConditionsValues[2])
      },
      {
        0: LowMembershipFunction(__ruleParamsObject.conditionsParamsObject.limphoConditionsValues[0]),
        1: GaussianMembershipFunction(__ruleParamsObject.conditionsParamsObject.limphoConditionsValues[1]),
        2: HighMembershipFunction(__ruleParamsObject.conditionsParamsObject.limphoConditionsValues[2])
      },
      {
        0: LowMembershipFunction(__ruleParamsObject.conditionsParamsObject.leukoConditionsValues[0]),
        1: GaussianMembershipFunction(__ruleParamsObject.conditionsParamsObject.leukoConditionsValues[1]),
        2: HighMembershipFunction(__ruleParamsObject.conditionsParamsObject.leukoConditionsValues[2])
      }
    ];
    int conclusionIndex = 0;
    for (int mycoIndex = 0, endMyco = __ruleParamsObject.countOfMycoFunctions; mycoIndex < endMyco; mycoIndex++) {
      for (int tempeIndex = 0, endTempe = __ruleParamsObject.countOfTempeFunctions; tempeIndex < endTempe; tempeIndex++) {
        for (int limphoIndex = 0, endLimpho = __ruleParamsObject.countOfLimphoFunctions; limphoIndex < endLimpho; limphoIndex++) {
          for (int leukoIndex = 0, endLeuko = __ruleParamsObject.countOfLeukoFunctions; leukoIndex < endLeuko; leukoIndex++) {
            __rulesList.add(
            Rule(
                ConditionsList()
                  ..add(Condition(map[0][mycoIndex]!))
                  ..add(Condition(map[1][tempeIndex]!))
                  ..add(Condition(map[2][limphoIndex]!))
                  ..add(Condition(map[3][leukoIndex]!)),
                Conclusion(__ruleParamsObject.conclusionParamsObject.conclusionsParams[conclusionIndex]))
            );
            conclusionIndex++;
          }
        }
      }
    }
  }

  int get __linearRegressionCoeffsCount => __rulesList[0].conclusion.linearRegressionCoeffsCount;

  Map<String, dynamic> conditionsToJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["myco"] = [__rulesList[0].getCondition(0).getTerm.functionsCoeffs, __rulesList[27].getCondition(0).getTerm.functionsCoeffs];
    data["tempe"] = [__rulesList[0].getCondition(1).getTerm.functionsCoeffs, __rulesList[9].getCondition(1).getTerm.functionsCoeffs, __rulesList[18].getCondition(1).getTerm.functionsCoeffs]; // продолжить
    data["limpho"] = [__rulesList[0].getCondition(2).getTerm.functionsCoeffs, __rulesList[3].getCondition(2).getTerm.functionsCoeffs, __rulesList[6].getCondition(2).getTerm.functionsCoeffs];
    data["leuko"] = [__rulesList[0].getCondition(3).getTerm.functionsCoeffs, __rulesList[1].getCondition(3).getTerm.functionsCoeffs, __rulesList[2].getCondition(3).getTerm.functionsCoeffs];
    return data;
  }

  int get size => __rulesList.length;

  int get variablesCount => __rulesList[0].variablesCount;

  List<Rule> get getAllRules => __rulesList;

  List<dynamic> conclusionsToJson() {
    int coeffsCount = __rulesList[0].conclusion.linearRegressionCoeffsCount;
    List<dynamic> data = [];
    for (int ruleIndex = 0, rulesCount = size; ruleIndex < rulesCount; ruleIndex++) {
      List<double> list = [];
      for (int coeffIndex = 0; coeffIndex < coeffsCount; coeffIndex++) {
        double coefficient = __rulesList[ruleIndex].conclusion.getLinearRegressionCoefByIndex(coeffIndex);
        list.add(coefficient);
      }
      data.add(list);
    }
    return data;
  }

  Rule getRuleByIndex(int index) => __rulesList[index];

  void setLinearRegressionCoeff(int ruleIndex, int coeffIndex, double value) => __rulesList[ruleIndex].conclusion.setLinearRegressionCoefByIndex(coeffIndex, value);

  double getLinearRegressionCoeff(int ruleIndex, int coeffIndex) => __rulesList[ruleIndex].conclusion.getLinearRegressionCoefByIndex(coeffIndex);
}