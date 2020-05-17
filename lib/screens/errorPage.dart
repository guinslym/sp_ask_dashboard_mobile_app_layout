import 'package:flutter/material.dart';

class errorPageScreen extends StatelessWidget {
  const errorPageScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Center(
            child: Text("errorPageScreen"),
          ),
        ],
      ),
    );
  }
}
