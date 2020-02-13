import 'package:flutter/material.dart';
import 'package:flutter_app/pages/catalogue/catalogue.dart';
import 'package:flutter_app/pages/splash/splash.dart';
import 'package:flutter_app/utils/app.dart';

var routes = <String, WidgetBuilder>{
  'catalogue': (BuildContext context) => CatalogueScreen(),
};


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Frubana Demo',
      theme: ThemeData(primaryColor: App.mainColor, accentColor: App.secondaryColor),
      home: SplashScreen(),
      routes: routes,
    );
  }
}