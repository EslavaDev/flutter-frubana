import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_app/components/loading/loading.dart';


class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    startTime();
  }

  void startTime() async {
    Timer(Duration(seconds: 5),
            () => Navigator.pushReplacementNamed(context, 'catalogue'));
  }


  @override
  Widget build(BuildContext context) {
    return Loading();
  }
}
