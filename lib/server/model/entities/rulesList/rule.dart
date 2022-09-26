import 'conclusion.dart';
export 'conclusion.dart';
import 'conditions/conditionsList.dart';
export 'conditions/conditionsList.dart';

class Rule {
  late ConditionsList __conditionsList = ConditionsList();
  late Conclusion __conclusion;

  Rule(ConditionsList conditionsList, Conclusion conclusion) {
    __conditionsList = conditionsList;
    __conclusion = conclusion;
  }

  Condition getCondition(int index) => __conditionsList.get(index);

  Conclusion get conclusion => __conclusion;

  int get variablesCount => __conditionsList.variablesCount;
}