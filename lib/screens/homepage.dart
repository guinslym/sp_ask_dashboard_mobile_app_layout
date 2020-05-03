import 'package:flutter/material.dart';
import 'package:sp_ask_dashboard_mobile_app_layout/screens/stories.dart';
import 'package:flutter/services.dart';
import 'package:sp_ask_dashboard_mobile_app_layout/screens/theame.dart';

class MyApp extends StatefulWidget {
  MyApp({Key key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown]);
    //var deviceSize = MediaQuery.of(context).size;

    return MaterialApp(
      theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      title: 'Mockup SP dashboard',
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
              //crossAxisAlignment: CrossAxisAlignment.center,
             // mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                  // Services
Expanded(
                  flex: 1,
                  child: Container(
                    margin: EdgeInsets.all(10.0),
                    height: MediaQuery.of(context).size.height * 0.25,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: primary
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                       Image.asset('images/male.png',height: 100.0,width: 100.0,),
                       SizedBox(
                           height: 20.0,
                        ),
                       Text('MALE',style: headlines)
                     ],
                      ),
                   
                  ),
                ),

                Expanded(
                  flex: 1,
                  child: Container(
                    margin: EdgeInsets.all(10.0),
                    height: MediaQuery.of(context).size.height * 0.25,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: primary
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Image.asset('images/female.png',height: 100.0,width: 100.0,),
                        SizedBox(
                           height: 20.0,
                        ),
                        Text('FEMALE',style: headlines)
                      ],
                    ),
                  ),
                )
              ],
            ),
            
                  ],
                ),
                
      ),
    );
  }
}



