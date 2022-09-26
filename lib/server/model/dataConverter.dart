class DataConverter {
  static DataConverter __instance = DataConverter._internal();
  static late List<double> __mins, __maxs;

  factory DataConverter({List<double> mins = const[], List<double> maxs = const[]}) {
    if (!mins.isEmpty) {
      __mins = mins;
      __maxs = maxs;
    }
    return __instance;
  }

  DataConverter._internal() {

  }

  double codingX(double x, double min, double max, double range) {
    //minmax нормализация в диапазоне range
    return .0;
  }

  double decodingX(double x, int variableIndex) {
    switch (variableIndex) {
      case 0:
        return (((x * (__maxs[variableIndex] - __mins[variableIndex])) + __mins[variableIndex])).round().toDouble();
      default:
        return double.parse(((x * (__maxs[variableIndex] - __mins[variableIndex])) + __mins[variableIndex]).toStringAsFixed(17));
    }
  }
}

