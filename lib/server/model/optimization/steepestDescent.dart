import '../entities/rulesList/rulesList.dart';
import '../dataConverter.dart';

class SteepestDescent {

  static void run({List<List<double>> xData = const[], List<List<double>> aggregatedWeights = const[],
    List<double> errorVector = const [], List<double> aws = const [], double learningRate = 0.1}) { // дописать
    int variablesCount = RulesList().variablesCount, rulesCount = RulesList().size,
        coeffsCount = RulesList().getRuleByIndex(0).getCondition(0).getTerm.functionCoeffsCount;
    List<List<List<double>>> means = List.filled(rulesCount, List.filled(variablesCount, List.filled(coeffsCount, 0.0)));
      for (int rowIndex = 0, rowsCount = xData.length; rowIndex < rowsCount; rowIndex++) {
        for (int k = 0; k < rulesCount; k++) {
          for (int variableIndex = 0; variableIndex < variablesCount; variableIndex++) {
            for (int coeffIndex = 0; coeffIndex < coeffsCount; coeffIndex++) {
              double errorDerivative = __errorDerivative(xData[rowIndex], errorVector[rowIndex], aggregatedWeights[rowIndex], aws[rowIndex], k, variableIndex, coeffIndex);
              //print("errorDerivative --- $errorDerivative");
              means[k][variableIndex][coeffIndex] += errorDerivative;
            }
          }
        }
      }
      for (int k = 0; k < rulesCount; k++) {
        for (int variableIndex = 0; variableIndex < variablesCount; variableIndex++) {
          for (int coeffIndex = 0; coeffIndex < coeffsCount; coeffIndex++) {
            double coeffValue = RulesList().getRuleByIndex(k).getCondition(variableIndex).getTerm.getFunctionCoeffByIndex(coeffIndex);
            RulesList().getRuleByIndex(k).getCondition(variableIndex).getTerm.setFunctionCoeffByIndex(coeffIndex,
                coeffValue - learningRate * (means[k][variableIndex][coeffIndex] / xData.length));
            //print("coeffValue AFTERRR --- ${RulesList().getRuleByIndex(0).getCondition(0).getTerm.getFunctionCoeffByIndex(2)}");
          }
        }
      }
    }

  static double __aggregatedWeightDerivative(int r, int i, int coeffIndex, double x, double aggregatedWeight) {
    double derr = RulesList().getRuleByIndex(r).getCondition(i).getTerm.getValue(x) * RulesList().getRuleByIndex(r).getCondition(i).getTerm.getDerivativeByCoeffIndex(coeffIndex, DataConverter().decodingX(x, i));
    //print("arg --- ${DataConverter().decodingX(x, i)}");
    derr = derr.isNaN ? 0.0 : derr;
    //print("functions derr --- $derr");
    double der = aggregatedWeight * derr;
    //print("aggregatedWeightDerivative --- $der");
    return der;
  }

  static double __weightsDerivative(double x, double aggregatedWeight, double aws, int r, int k, int i, int coeffIndex) =>
      (__kroneckerDelta(x, aggregatedWeight, r, k, i, coeffIndex) * aws - (aggregatedWeight * __aggregatedWeightDerivative(k, i, coeffIndex, x, aggregatedWeight))) / (aws * aws);

  static double __crispValueDerivative(List<double> xVector, List<double> aggregatedWeights, double aws, int k, int i, int coeffIndex) {
    double summ = 0.0;
    for (int r = 0, rulesCount = RulesList().size; r < rulesCount; r++) {
      summ += RulesList().getRuleByIndex(r).conclusion.getLinearRegressionValue(xVector) * __weightsDerivative(xVector[i], aggregatedWeights[r], aws, r, k, i, coeffIndex);
    }
    return summ;
  }

  static double __errorDerivative(List<double> xVector, double error, List<double> aggregatedWeights, double aws, int k, int i, int coeffIndex) {
    double value = __crispValueDerivative(xVector, aggregatedWeights, aws, k, i, coeffIndex);
    return error * value;
  }

  static double __kroneckerDelta(double x, double aggregatedWeight, int r, int k, int i, int coeffIndex) =>
    r == k ? __aggregatedWeightDerivative(r, i, coeffIndex, x, aggregatedWeight) : 0.0;
}