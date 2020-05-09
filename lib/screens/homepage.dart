import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sp_ask_dashboard_mobile_app_layout/screens/theame.dart';
import 'package:sp_ask_dashboard_mobile_app_layout/widgets/widgets.dart';

// Http request
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

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

  void ButtonClick(){
    print("Button cliccked");
  }
  String response = "HEllO";
  String web = "?";
  String sms = "?";
  String clavardez = "?";

  Future<String> _makeRequest({String my_queue="clavardez"}) async {
    String url =
        "https://ca.libraryh3lp.com/presence/jid/"+my_queue+"/chat.ca.libraryh3lp.com/text";
    var response = await http.get(Uri.encodeFull(url));
    print(response.body.toString());

    return response.body.toString();
  }

  Future<String> serviceContentValue;
  @override
  void initState() {
    super.initState();
    serviceContentValue = _makeRequest();
    response = 'Not in state';
  }

  final List<int> numbers = [1, 2, 3, 5, 8, 13, 21, 34, 55];
  final List<String> services = [
    'scholars-portal',
    "scholars-portal-txt",
    "clavardez"
  ];
  int age = 17;
  int weight = 50;

  int height = 180;
  double maxHeight = 220;
  double minHeight = 120;

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
            // Services

            AskContent(
                cardTitle: Text('Daily'),
                cardValue: Text("90", style: resultContentAskWhite)),
            AskContent(
                cardTitle: Text('Monthly'),
                cardValue: Text("1,534", style: resultContentAskWhite)),
          ],
        ),
        AskAddSpaceToRowWidget(),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Services', style: headlineTitle),
            Container(
                child: FutureBuilder(
                    future: _makeRequest(),
                    builder: (BuildContext context, AsyncSnapshot snapshot) {
                      return Text(this.serviceContentValue.toString());
                    })),
          ],
        ),
        AskAddSpaceToRowWidget(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            AskContent(
                cardTitle: Text('Web'),
                cardValue: Text('$web', style: resultContentAskWhite)),
            AskContent(
                cardTitle: Text('SMS'),
                cardValue: Text("On", style: resultContentAskWhite)),
            AskContent(
                cardTitle: Text('Clavarder'),
                cardValue: Text("Off", style: resultContentAskRed)),
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
            AskContent(
                cardTitle: Text('SMS'),
                cardValue: Text("5", style: resultContentAskWhite)),
          ],
        ),
        RaisedButton(
          onPressed: ButtonClick,
          child: Text("Refresh"),
          color: Colors.grey,
          textColor: Colors.white,
          highlightColor: Colors.black,


          )
      ],
    );
  }
}








