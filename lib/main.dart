import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sp_ask_dashboard_mobile_app_layout/screens/homepage.dart';
import 'package:sp_ask_dashboard_mobile_app_layout/screens/operatorsOnline.dart';
import 'package:sp_ask_dashboard_mobile_app_layout/widgets/widgets.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

    return MaterialApp(
      theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      title: 'Mockup SP dashboard',
      home: operatorOnlineScreen(),
    );
  }
}
