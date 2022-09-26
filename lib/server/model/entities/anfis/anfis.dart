import '../rulesList/rulesList.dart';
import 'layers/aggregationLayer.dart';
import 'layers/fuzzificationLayer.dart';
import 'layers/activationLayer.dart';
import 'layers/normalizationLayer.dart';
import 'layers/outputLayer.dart';

class Anfis {
  int __variablesCount = 0, __rulesCount = 0;
  List<double>  __minX = [], __maxX = [];

  Anfis({int variablesCount = 0, String jsonConditionsFileName = "", String jsonConclusionsFileName = "", List<double> minValues = const [], List<double> maxValues = const []}) {
    __variablesCount = variablesCount;
    __minX = minValues;
    __maxX = maxValues;
    __rulesCount = RulesList(conditionsJSONFileName: jsonConditionsFileName, conclusionsJSONFileName: jsonConclusionsFileName).size;
  }

  List<List<double>> __forwardPass(List<double> inputData, {extraOptions = false}) {
    List<double> fuzzificatedWeights = FuzzificationLayer.getFuzzificatedNeuronsWeights(inputData, __minX, __maxX);
    List<double> aggregatedWeights = AggregationLayer.aggregateSubConditions(fuzzificatedWeights, __variablesCount, __rulesCount);
    double weightsSum = aggregatedWeights.reduce((sum, element) => sum + element);
    List<double> normalizatedWeights = NormalizationLayer.getNormalizatedNeuronsWeights(aggregatedWeights, weightsSum);
    return extraOptions ? [normalizatedWeights, aggregatedWeights, [weightsSum]] : [normalizatedWeights];
  }

  double predict(List<double> inputData) {
    List<double> normalizedWeights = __forwardPass(inputData)[0];
    List<double> activatedWeights = ActivationLayer.calculateActivatedNeuronsWeights(inputData, normalizedWeights);
    return OutputLayer.getInfectionMetric(activatedWeights);
  }
}