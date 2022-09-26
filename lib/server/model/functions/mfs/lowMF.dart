import 'mfInterface.dart';
import 'dart:math' show pow, log;

class LowMembershipFunction implements IMembershipFunction {
  List<double> __coeffs = [];

  LowMembershipFunction(List<double> coeffs) {
    __coeffs = coeffs;
  }

  double __denominator(double x) => (1 + pow(((x - __coeffs[0]) / __coeffs[1]), 2 * __coeffs[2])).toDouble();

  @override
  double getValue(double x) {
    if (x >= __coeffs[0]) {
      double value = 1 / __denominator(x);
      return value.isNaN ? 0.0 : value;
    }
      return 1.0;
  }

  @override
  double getDerivativeByCoeffIndex(int index, double x) {
    switch (index) {
      case 0:
        return __derivativeByMu(x);
      case 1:
        return __derivativeBySigma(x);
      case 2:
        return __derivativeByPowCoeff(x);
      default:
        return 0.0;
    }
  }

  @override
  List<double> get functionsCoeffs => __coeffs;

  double __derivativeByMu(double x) =>
    x >= __coeffs[0] ? (((2 * __coeffs[2]) / __coeffs[1]) * pow(((x - __coeffs[0]) / __coeffs[1]), 2 * __coeffs[2] - 1)) / __denominator(x) : 0.0;

  double __derivativeBySigma(double x) =>
    x >= __coeffs[0] ? (((2 * __coeffs[2]) / __coeffs[1]) * pow(((x - __coeffs[0]) / __coeffs[1]), 2 * __coeffs[2])) / __denominator(x) : 0.0;

  double __derivativeByPowCoeff(double x) =>
    x >= __coeffs[0] ? (-2.0 * pow(((x - __coeffs[0]) / __coeffs[1]), 2 * __coeffs[2]) * log((x - __coeffs[0]) / __coeffs[1])) / __denominator(x) : 0.0;

  @override
  int get functionCoeffsCount => __coeffs.length;

  @override
  double getFunctionCoeffByIndex(int index) => __coeffs[index];

  @override
  void setFunctionCoeffByIndex(int index, double value) => __coeffs[index] = value;
}