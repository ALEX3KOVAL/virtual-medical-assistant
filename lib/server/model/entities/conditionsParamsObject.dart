class ConditionsParamsObject {
Map<String, List<List<double>>> __conditionsMap = {};
ConditionsParamsObject(Map<String, List<List<double>>> conditionsMap) {
__conditionsMap = conditionsMap;}
List<List<double>> get mycoConditionsValues => __conditionsMap['myco']!;
List<List<double>> get tempeConditionsValues => __conditionsMap['tempe']!;
List<List<double>> get limphoConditionsValues => __conditionsMap['limpho']!;
List<List<double>> get leukoConditionsValues => __conditionsMap['leuko']!;}