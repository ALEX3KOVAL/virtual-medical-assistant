class LinearRegression {
  late List<double> __weights;

  LinearRegression(List<double> weights) {
    __weights = List.filled(weights.length, 0.0);
    __weights = weights;
  }

  void setValueByIndex(int index, double value) => __weights[index] = value;

  double predict(List<double> variablesWeights) {
    double result = __weights[0];
    for (int i = 1, length = __weights.length; i < length; i++) {
      result += __weights[i] * variablesWeights[i-1];
    }
    return result;
  }

  double getCoefByIndex(int index) => __weights[index];

  int get coeffsCount => __weights.length;
}