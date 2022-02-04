import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:origo_iceland_project_app/screens/home_page.dart';

class Utils {
  static bool isNumeric(String value) {
    return double.tryParse(value) != null;
  }

  static double getBmiValue(double height, double weight) {
    double heightSquare = height * height;
    double result = weight / heightSquare;
    return result;
  }

  static void hideKeyboard(BuildContext context) {
    FocusScope.of(context).unfocus();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
  }

  static Future<void> saveAllAndGoBack(BuildContext context) async {
    hideKeyboard(context);
    await showModalBottomSheet(
      context: context,
      builder: (context) => Container(
        color: Colors.lightGreenAccent,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.1,
        alignment: Alignment.center,
        child: const Text('SAVED', style: TextStyle(fontSize: 20, color: Colors.black, fontWeight: FontWeight.w500)),
      ),
      enableDrag: false,
      isDismissible: true,
    ).timeout(
      const Duration(seconds: 2),
      onTimeout: () {
        Navigator.of(context).pop();
      },
    );
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) => const Home(),
        ),
        (route) => false);
  }

  static void showErrorModal(BuildContext context) {
    hideKeyboard(context);
    showModalBottomSheet(
      context: context,
      builder: (context) => Container(
        color: Colors.redAccent,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.1,
        alignment: Alignment.center,
        child: const Text('FIELDS ARE NOT VALID',
            style: TextStyle(fontSize: 20, color: Colors.black, fontWeight: FontWeight.w500)),
      ),
      enableDrag: false,
      isDismissible: true,
    ).timeout(
      const Duration(seconds: 2),
      onTimeout: () {
        Navigator.of(context).pop();
      },
    );
  }
}
