class NormalizationLayer {
  static List<double> getNormalizatedNeuronsWeights(List<double> weights, double weightsSum) {
    if (weightsSum == 0.0) {
      return List.generate(weights.length, (_) => 0.0);
    }
    return weights.map((element) => element / weightsSum).toList();
  }
}