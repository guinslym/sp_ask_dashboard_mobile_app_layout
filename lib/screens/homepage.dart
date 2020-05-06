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



class AskDashboard extends StatefulWidget {
  AskDashboard({Key key}) : super(key: key);

  @override
  _AskDashboardState createState() => _AskDashboardState();
}

class _AskDashboardState extends State<AskDashboard> {

  String response = "HEllO";

  Future<String> _makeRequest() async {
    String url = "https://ca.libraryh3lp.com/presence/jid/clavardez/chat.ca.libraryh3lp.com/text";
    var response = await http.get(Uri.encodeFull(url));
    print(response.body.toString());

    return response.body.toString();
    
  }


  Future<String> serviceContentValue;
   @override
  void initState() {
    super.initState();
    serviceContentValue = _makeRequest();
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

            AskContent(cardTitle: Text('Daily'), cardValue:Text("90",
                  style: resultContentAskWhite)),
            AskContent(cardTitle: Text('Monthly'), cardValue:Text("1,534",
                  style: resultContentAskWhite)),
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
                builder: (BuildContext context, AsyncSnapshot snapshot){
                  return Text(this.serviceContentValue.toString());
                })
            ),
            
          ],
        ),
        AskAddSpaceToRowWidget(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            AskContent(cardTitle: Text('Web'), cardValue:Text("On",
                  style: resultContentAskWhite)),
            AskContent(cardTitle: Text('SMS'), cardValue:Text("On",
                  style: resultContentAskWhite)),
            AskContent(cardTitle: Text('Clavarder'), cardValue:Text("Off",
                  style: resultContentAskRed)),
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
            AskContent(cardTitle: Text('SMS'), cardValue:Text("5",
                  style: resultContentAskWhite)),
          ],
        ),
      ],
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

class AskContent extends StatelessWidget {
  

  final Text cardTitle;
  final Text cardValue;
  //Color colour,
  AskContent({Key key, @required this.cardTitle
  , @required this.cardValue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Container(
        margin: EdgeInsets.all(10.0),
        //height: MediaQuery.of(context).size.height * 0.25,
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
            offset: Offset(
              5.0, // horizontal, move right 10
              5.0, // vertical, move down 10
            ),
          )
        ], borderRadius: BorderRadius.circular(10.0), color: primary),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            //Image.asset('images/male.png',height: 100.0,width: 100.0,),
            SizedBox(
              height: 40.0,
            ),
            this.cardTitle ,
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: this.cardValue,
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
