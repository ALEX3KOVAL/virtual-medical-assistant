import '../../rulesList/rule.dart';
import '../../rulesList/rulesList.dart';
import '../../../dataConverter.dart';

class FuzzificationLayer {

  static List<double> getFuzzificatedNeuronsWeights(List<double> inputData, List<double> mins, List<double> maxs) {
    int ruleIndex = 0, variablesCount = RulesList().variablesCount, rulesCount = RulesList().size;
    List<double> fuzzificatedNeuronsWeights = List.filled(rulesCount * variablesCount, 0.0);
    for (Rule rule in RulesList().getAllRules) {
      for (int variableIndex = 0; variableIndex < variablesCount; variableIndex++) {
        double vvv = rule.getCondition(variableIndex).getTerm.getValue(DataConverter().decodingX(inputData[variableIndex], variableIndex));
        print("vvvvv ------ $vvv");
        fuzzificatedNeuronsWeights[variableIndex * rulesCount + ruleIndex] = vvv;
      }
      ruleIndex++;
    }
    print("fuzzificatedNeuronsWeights --- $fuzzificatedNeuronsWeights");
    return fuzzificatedNeuronsWeights;
  }
}