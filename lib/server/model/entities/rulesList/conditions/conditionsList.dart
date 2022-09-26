import 'condition.dart';
export 'condition.dart';

class ConditionsList {
  late List<Condition> __conditionsList = [];

  Condition get(int index) => __conditionsList[index];

  void add(Condition condition) {
    __conditionsList.add(condition);
  }

  int get variablesCount => __conditionsList.length;
}