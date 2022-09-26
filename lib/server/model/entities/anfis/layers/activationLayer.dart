import '../../rulesList/rulesList.dart';

class ActivationLayer {

  static List<double> calculateActivatedNeuronsWeights(List<double> inputData, List<double> normalizedWeights) {
    List<double> __activatedNeuronsWeights = List.filled(RulesList().size, 0.0);
    for (int i = 0, length = __activatedNeuronsWeights.length; i < length; i++) {
      __activatedNeuronsWeights[i] = normalizedWeights[i] * RulesList().getRuleByIndex(i).conclusion.getLinearRegressionValue(inputData);
    }
    return __activatedNeuronsWeights;
  }
}