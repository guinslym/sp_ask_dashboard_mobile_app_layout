import 'package:flutter/material.dart';

Color primary = Color.fromRGBO(28, 40, 51, 0.8);
Color secondary = Colors.black;
Color primaryButtonColor = Colors.orangeAccent; //HexColor("e74c3c");
Color secondaryButtonColor = Colors.white;

TextStyle headlines =
    TextStyle(letterSpacing: 2.0, fontSize: 15, color: Colors.white);
TextStyle boldNumber =
    TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 50.0);
TextStyle boldNumberRed =
    TextStyle(color: Colors.red, fontWeight: FontWeight.bold, fontSize: 50.0);
TextStyle headlineTitle =
    TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 30.0);
TextStyle secondaryButtonColorStyle = TextStyle(
    color: secondaryButtonColor, fontWeight: FontWeight.bold, fontSize: 26.0);
TextStyle primaryButtonStyle = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.normal,
    letterSpacing: 1,
    wordSpacing: 2,
    color: secondaryButtonColor);
TextStyle resultNumber = TextStyle(
    color: Colors.white,
    fontWeight: FontWeight.bold,
    fontSize: 80.0,
    letterSpacing: 0.1);

TextStyle resultContentAskWhite =
    TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 50.0);

TextStyle resultContentAskRed =
    TextStyle(color: Colors.red, fontWeight: FontWeight.bold, fontSize: 50.0);

TextStyle resultContentLoading =
    TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20.0);
