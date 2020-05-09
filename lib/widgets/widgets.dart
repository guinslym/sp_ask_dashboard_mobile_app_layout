import 'package:flutter/material.dart';
import 'package:sp_ask_dashboard_mobile_app_layout/screens/theame.dart';

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
  AskContent({
    Key key,
    @required this.cardTitle,
    @required this.cardValue,
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
            this.cardTitle,
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
