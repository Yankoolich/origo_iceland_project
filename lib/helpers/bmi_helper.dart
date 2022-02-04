class BMIHelper {
  static double getBmiValue(double height, double weight) {
    double heightSquare = height * height;
    double result = weight / heightSquare;
    return result;
  }
}
