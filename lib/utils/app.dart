import 'package:flutter/material.dart';

class App {
  static App _instance = new App.internal();
  App.internal();
  factory App() => _instance;

  static const String name = "Trabajadores PeerPeel";
  static const String baseUrl = "http://3.17.64.123:5000/api/v1";
  static const Color mainColor = const Color(0xFFCF734F);
  static const Color mainColor20 = const Color(0x33502768);
  static const Color mainColor50 = const Color(0x7F502768);
  static const Color secondaryColor = const Color(0xFF502768);
  static const Color backgroundColor = const Color(0xFFF8F8F8);
  static List<Color> kitGradients = [
    // new Color.fromRGBO(103, 218, 255, 1.0),
    // new Color.fromRGBO(3, 169, 244, 1.0),
    // new Color.fromRGBO(0, 122, 193, 1.0),

    Colors.blueGrey.shade800,
    Colors.black87,
    Colors.blueGrey.shade900,
  ];
  static double width(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  static double height(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  static double percentageToDecimal(double percentage) {
    return percentage / 100;
  }

  static double responsiveWidth(BuildContext context, double percentage) {
    return width(context) * percentageToDecimal(percentage);
  }

  static double responsiveHeight(BuildContext context, double percentage) {
    return height(context) * percentageToDecimal(percentage);
  }

  static bool validateEmail(String email) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    return !regex.hasMatch(email);
  }
}
