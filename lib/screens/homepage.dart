import 'package:flutter/material.dart';

class MyApp extends StatefulWidget {
  MyApp({Key key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'step 18 day 2',
      home: Scaffold(
        appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 18.0,
        title: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Text(
                "SP Ask Dashboard",
                style: TextStyle(fontSize: 20.0),
              ),
              new Text(
                "Mobile app",
                style: TextStyle(fontSize: 14.0),
              )
            ],
          ),
        ),
      ),
       body: new Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Row(children: <Widget>[
                  Column(

                  )
                ],),
                new Text("John Doe",
                    textScaleFactor: 1.5)
              ],
         
            ),
      ),
    );
  }
}