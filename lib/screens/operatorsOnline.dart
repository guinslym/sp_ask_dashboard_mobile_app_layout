import 'package:flutter/material.dart';
import 'package:sp_ask_dashboard_mobile_app_layout/widgets/widgets.dart';

class operatorOnlineScreen extends StatefulWidget {
  @override
  _operatorOnlineScreenState createState() => _operatorOnlineScreenState();
}

class _operatorOnlineScreenState extends State<operatorOnlineScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff162029),
        automaticallyImplyLeading: false,
        elevation: 18.0,
        title: AskAppBarContentWidget(),
      ),
      body: operatorList(),
    );
  }
}

class operatorList extends StatelessWidget {
  //const operatorList({Key key}) : super(key: key);
  final messages = [
    "Hello world",
    "Hello world again ",
    "Hello world in Toronto",
    "Hello world in Canada",
    "Hello world in Rwanda",
    "Hello world in USA",
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Center(
            child: Text("operatorList"),
          ),
        ],
      ),
    );
  }
}
