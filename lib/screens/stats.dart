import 'package:flutter/material.dart';

class stats extends StatelessWidget {
  const stats({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Center(child: Text("stats"),),
        ],
      ),
    );
  }
}