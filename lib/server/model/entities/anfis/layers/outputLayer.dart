class OutputLayer {
  static double getInfectionMetric(List<double> activatedNeuronsWeights) => activatedNeuronsWeights.reduce((sum, element) => sum + element);
}