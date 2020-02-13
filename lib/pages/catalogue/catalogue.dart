import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/utils/app.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CatalogueScreen extends StatefulWidget {
  @override
  _CatalogueScreenState createState() => _CatalogueScreenState();
}

class _CatalogueScreenState extends State<CatalogueScreen> {
  bool test = false;
  @override
  void initState() {
    super.initState();
    setState(() {
      test = false;
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  List<Widget> buildChildren() {
    var builder = [
      Align(
        alignment: Alignment(.9, 1),
        child: FloatingActionButton(
            backgroundColor: Color(0xFF9aa739),
            onPressed: () {
              setState(() {
                test = !test;
              });
            },
            child: Align(
              alignment: Alignment(0,0.5),
              child: SvgPicture.asset(
                'assets/svg/help-button.svg',
                semanticsLabel: 'help-button',
                width: App.responsiveWidth(context, 11),
              ),
            )),
      ),
    ];
    if (test) {
      builder.addAll([
        Align(
          alignment: Alignment(.5, 1.03),
          child: FloatingActionButton(
              backgroundColor: Color(0xFFf26522),
              child: SvgPicture.asset('assets/svg/chat.svg',
                  semanticsLabel: 'chat')),
        ),
        Align(
          alignment: Alignment(.63, .87),
          child: FloatingActionButton(
              backgroundColor: Color(0xFF25d366),
              child: SvgPicture.asset('assets/svg/whatsapp.svg',
                  semanticsLabel: 'whatsapp')),
        ),
        Align(
          alignment: Alignment(.95, .8),
          child: FloatingActionButton(
              backgroundColor: Color(0xFF006ca2),
              child: SvgPicture.asset(
                'assets/svg/twnel.svg',
                semanticsLabel: 'twnel',
              )),
        )
      ]);
    }
    return builder;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
            borderRadius: BorderRadius.circular(50),
            onTap: () {
              print("Work rechazado");
              showReview(context);
            },
            child: Icon(
              Icons.account_circle,
              color: Colors.white,
              size: App.responsiveWidth(context, 7),
            )),
        title: Text('Frubana'),
      ),
      body: SafeArea(
        child: Container(
          child: Stack(
            children: buildChildren(),
          ),
        ),
      ),
    );
  }
}

Future<bool> showReview(context) {
  return showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return Dialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)),
            child: Container(
                height: 350.0,
                width: 200.0,
                decoration:
                BoxDecoration(borderRadius: BorderRadius.circular(20.0)),
                child: Column(
                  children: <Widget>[
                    Stack(
                      children: <Widget>[
                        Container(height: 150.0),
                        Container(
                          height: 180.0,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10.0),
                                topRight: Radius.circular(10.0),
                              ),
                              color: Colors.teal),
                        ),
                        Positioned(
                            top: 50.0,
                            left: 90.0,
                            child: Container(
                              height: 110.0,
                              width: 110.0,
                                child: Image(
                                  image:  new AssetImage("assets/images/logo-frubana.png"),
                                ),
                            ))
                      ],
                    ),
                    SizedBox(height: 20.0),
                    Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Text(
                          "Popups",
                          style: TextStyle(
                            fontFamily: 'Quicksand',
                            fontSize: 14.0,
                            fontWeight: FontWeight.w300,
                          ),
                        )),
                    SizedBox(height: 15.0),
                    FlatButton(
                        child: Center(
                          child: Text(
                            'OKAY',
                            style: TextStyle(
                                fontFamily: 'Montserrat',
                                fontSize: 14.0,
                                color: Colors.teal),
                          ),
                        ),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        color: Colors.transparent
                    )
                  ],
                )));
      });
}
