abstract class IMembershipFunction {
  double getValue(double x);
  double getFunctionCoeffByIndex(int index);
  int get functionCoeffsCount;
  double getDerivativeByCoeffIndex(int index, double x);
  List<double> get functionsCoeffs;
  void setFunctionCoeffByIndex(int index, double value);
}