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
    return ListView.separated(
          itemCount: messages.length,
          separatorBuilder: (context, index) => Divider(),
          itemBuilder: (BuildContext context, int index){
            var title = messages[index];
            return ListTile(
              title: Text(title),
              isThreeLine: true,
              leading: CircleAvatar(
                child:  Text("QC"),
              ),
              subtitle: Text("Another Post $index with very longstile lorem ipsum"),);
          },
          );
  }
}
