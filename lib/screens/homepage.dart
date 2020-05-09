import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sp_ask_dashboard_mobile_app_layout/screens/theame.dart';
import 'package:sp_ask_dashboard_mobile_app_layout/widgets/widgets.dart';

// Http request
import "package:intl/intl.dart";
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:requests/requests.dart';

/*

queues = ['scholars-portal', "scholars-portal-txt", "clavardez"]
start_url = "https://ca.libraryh3lp.com/presence/jid/"
end_url =  "/chat.ca.libraryh3lp.com/text"
*/

class AskDashboard extends StatefulWidget {
  AskDashboard({Key key}) : super(key: key);

  @override
  _AskDashboardState createState() => _AskDashboardState();
}

class _AskDashboardState extends State<AskDashboard> {
  String loading = "?";

  Future<String> _makeRequest(String myQueue) async {
    String url =
        "https://ca.libraryh3lp.com/presence/jid/$myQueue/chat.ca.libraryh3lp.com/text";
    var response = await http.get(Uri.encodeFull(url));
    // print(myQueue + ": " + response.body.toString());

    return response.body.toString();
  }

  Text translateResponseService(String answer) {
    // print("my answer : " + answer.toString());
    if (answer.toString() == 'available') {
      return Text("On", style: resultContentAskWhite);
    } else {
      return Text("Off", style: resultContentAskRed);
    }
  }

    Text translateResponseInt(String answer) {
    // print("my answer : " + answer.toString());
    if (answer.toString().length >0) {
      return Text(answer.toString(), style: resultContentAskWhite);
    } else {
      return Text(answer.toString(), style: resultContentAskRed);
    }
  }

  Future<String> _getChats(String myQueue) async {
    String url =
        "http://localhost:5000/lh3/api/v1.0/$myQueue";
        print(url);
    var response = await http.get(Uri.encodeFull(url));
    // print(myQueue + ": " + response.body.toString());
    var jsonData = json.decode(response.body);
    print(jsonData);

    return jsonData['result'];
  }


  
Map headers = {
    'content-type': 'application/json',
    'accept': 'application/json',
    'authorization': 'Basic ' + base64Encode(utf8.encode('user:pass'))
 };

  @override
  Widget build(BuildContext context) {
    //var deviceSize = MediaQuery.of(context).size;

    return Column(
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
            // Stats

                FutureBuilder(
        future: _getChats("daily"),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.data == null) {
            return AskContent(
              cardTitle: Text('Daily'),
              cardValue:
                  Text(loading, style: resultContentAskWhite),
            );
          } else {
            return AskContent(
                cardTitle: Text('Daily'),
                cardValue: translateResponseInt(snapshot.data.toString()));
          }
        }),

                FutureBuilder(
        future: _getChats("monthly"),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.data == null) {
            return AskContent(
              cardTitle: Text('Monthly'),
              cardValue:
                  Text(loading, style: resultContentAskWhite),
            );
          } else {
            return AskContent(
                cardTitle: Text('Monthly'),
                cardValue: translateResponseInt(snapshot.data.toString()));
          }
        }),



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
            FutureBuilder(
                future: _makeRequest("scholars-portal"),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.data == null) {
                    return AskContent(
                      cardTitle: Text('web'),
                      cardValue:
                          Text(loading, style: resultContentAskWhite),
                    );
                  } else {
                    return AskContent(
                        cardTitle: Text('web'),
                        cardValue: translateResponseService(snapshot.data.toString()));
                  }
                }),
            FutureBuilder(
                future: _makeRequest("clavardez"),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.data == null) {
                    return AskContent(
                      cardTitle: Text('clavardez'),
                      cardValue:
                          Text(loading, style: resultContentAskWhite),
                    );
                  } else {
                    return AskContent(
                        cardTitle: Text('clavardez'),
                        cardValue: translateResponseService(snapshot.data.toString()));
                  }
                }),
            FutureBuilder(
                future: _makeRequest("scholars-portal-txt"),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.data == null) {
                    return AskContent(
                      cardTitle: Text('sms'),
                      cardValue:
                          Text(loading, style: resultContentAskWhite),
                    );
                  } else {
                    return AskContent(
                      cardTitle: Text('sms'),
                      cardValue: translateResponseService(snapshot.data.toString()),
                    );
                  }
                }),
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

            FutureBuilder(
        future: _getChats("online_operators"),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.data == null) {
            return AskContent(
              cardTitle: Text('Operators'),
              cardValue:
                  Text(loading, style: resultContentAskWhite),
            );
          } else {
            return AskContent(
                cardTitle: Text('Operators'),
                cardValue: translateResponseInt(snapshot.data.toString()));
          }
        }),

          ],
        ),
        RaisedButton(
          onPressed: () => _getChats("monthly"),
          child: Text("Refresh"),
          color: Colors.grey,
          textColor: Colors.white,
          highlightColor: Colors.black,
        )
      ],
    );
  }
}
