class AggregationLayer {
  static List<double> aggregateSubConditions(List<double> fuzzificatedNeuronsWeights, int variablesCount, int rulesCount) {
    List<double> aggregationList = List.filled(rulesCount, 0.0);
    for (int ruleIndex = 0; ruleIndex < rulesCount; ruleIndex++) {
      double aggregatedSubConditions = 1.0;
      for (int variableIndex = 0; variableIndex < variablesCount; variableIndex++) {
        int index = variableIndex * rulesCount + ruleIndex;
        print("index --- $index");
        print("value ---- ${fuzzificatedNeuronsWeights[index]}");
        aggregatedSubConditions *= fuzzificatedNeuronsWeights[index];
      }
      print("-----------------");
      aggregationList[ruleIndex] = aggregatedSubConditions;
    }
    print("aggregationList --- $aggregationList");
    return aggregationList;
  }
}