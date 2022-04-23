import 'notifications.dart';
import 'package:flutter/material.dart';

class NotiPage extends StatefulWidget {
  const NotiPage({Key? key}) : super(key: key);

  @override
  _NotiPageState createState() => _NotiPageState();
}

class _NotiPageState extends State<NotiPage> {
  @override
  Widget build(BuildContext context) => Scaffold(
    backgroundColor: const Color.fromRGBO(19, 22, 41, 1),
  appBar: AppBar(
    centerTitle: true,
    title: const Text('Notifications'),
    backgroundColor: const Color.fromRGBO(19, 22, 41, 1),
  ),
    body: ListView(
  children: <Widget>[
  Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
      Notifications(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const <Widget>[
                  Text("Dobby commented on your post", style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14.0,
                      color: Color.fromRGBO(255, 255, 255, 1))),
                  Text("15 mins ago", style: TextStyle(
                      fontSize: 14.0,
                      color: Color.fromRGBO(203, 208, 217, 1)
                  )),
                ]),
            Row(
                children: const <Widget>[
                  Text("Dobby likes socks", style: TextStyle(
                      fontSize: 14.0,
                      color: Color.fromRGBO(203, 208, 217, 1),
                  )),
                ]),
          ],
        ),),
    ],
  ),],
  ),
  );
}
