import '../../entities/linearRegression.dart';

class Conclusion {
  late LinearRegression __linearRegression;

  Conclusion(List<double> coeffs) {
    __linearRegression = LinearRegression(coeffs);
  }

  double getLinearRegressionValue(List<double> variablesWeigths) {
    return __linearRegression.predict(variablesWeigths);
  }

  void setLinearRegressionCoefByIndex(int index, double value) {
    __linearRegression.setValueByIndex(index, value);
  }

  int get linearRegressionCoeffsCount => __linearRegression.coeffsCount;

  double getLinearRegressionCoefByIndex(int index) => __linearRegression.getCoefByIndex(index);
}