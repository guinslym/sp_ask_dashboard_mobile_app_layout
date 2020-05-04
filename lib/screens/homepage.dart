import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sp_ask_dashboard_mobile_app_layout/screens/theame.dart';

// Http request
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

/*

queues = ['scholars-portal', "scholars-portal-txt", "clavardez"]
start_url = "https://ca.libraryh3lp.com/presence/jid/"
end_url =  "/chat.ca.libraryh3lp.com/text"
*/

Future<Album> fetchAlbum() async {
  final response =
      await http.get('https://ca.libraryh3lp.com/presence/jid/clavardez/chat.ca.libraryh3lp.com/text');

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return Album.fromJson(json.decode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}


class Album {
  final int userId;
  final int id;
  final String title;

  Album({this.userId, this.id, this.title});

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
    );
  }
}


class MyApp extends StatefulWidget {
  MyApp({Key key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  

  final List<int> numbers = [1, 2, 3, 5, 8, 13, 21, 34, 55];
  final List<String> services =  ['scholars-portal', "scholars-portal-txt", "clavardez"];
  int age = 17;
  int weight = 50;

  int height = 180;
  double maxHeight = 220;
  double minHeight = 120;

  Future<Album> futureAlbum;
  @override
  void initState() {
    super.initState();
    futureAlbum = fetchAlbum();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
    //var deviceSize = MediaQuery.of(context).size;

    return MaterialApp(
      theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      title: 'Mockup SP dashboard',
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xff162029),
          automaticallyImplyLeading: false,
          elevation: 18.0,
          title: AskAppBarContentWidget(),
        ),
        body: Column(
          //crossAxisAlignment: CrossAxisAlignment.center,
          // mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[





            AskAddSpaceToRowWidget(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('Stats', style: headlineTitle),
              ],
            ),
            AskAddSpaceToRowWidget(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                // Services
                
                AskServiceWidget(),
                AskServiceWidget(),
              ],
            ),
            AskAddSpaceToRowWidget(),
            
            
            
            
            
            
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('Services', style: headlineTitle),
              ],
            ),
            AskAddSpaceToRowWidget(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                AskServiceWidget(),
                AskServiceWidget(),
                AskServiceWidget(),
              ],
            ),
            AskAddSpaceToRowWidget(),






            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('Currently online', style: headlineTitle),
              ],
            ),
            Row(
              children: <Widget>[
              AskServiceWidget(),
              ],
            ),
            
          ],
        ),
      ),
    );
  }
}

class AskAddSpaceToRowWidget extends StatelessWidget {
  const AskAddSpaceToRowWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.0),
    );
  }
}

class AskServiceWidget extends StatelessWidget {
  const AskServiceWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Container(
        margin: EdgeInsets.all(10.0),
        //height: MediaQuery.of(context).size.height * 0.25,
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                offset: Offset(
                  5.0, // horizontal, move right 10
                  5.0, // vertical, move down 10
                ),
              )
            ],
            borderRadius: BorderRadius.circular(10.0),
            color: primary),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            //Image.asset('images/male.png',height: 100.0,width: 100.0,),
            SizedBox(
              height: 40.0,
            ),
            Text('SMS', style: headlines),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Off",
                  style: TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                      fontSize: 50.0)),
            ),
          ],
        ),
      ),
    );
  }
}



class AskAppBarContentWidget extends StatelessWidget {
  const AskAppBarContentWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            "SP Ask Dashboard",
            style: TextStyle(fontSize: 20.0),
          ),
          Text(
            "Mobile app",
            style: TextStyle(fontSize: 14.0),
          )
        ],
      ),
    );
  }
}
