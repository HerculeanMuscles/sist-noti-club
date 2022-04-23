import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:sistapp/page/clubs.dart';

class ClubPage extends StatefulWidget {
  const ClubPage({Key? key}) : super(key: key);

  @override
  _ClubPageState createState() => _ClubPageState();
}

class _ClubPageState extends State<ClubPage> {
  @override
  Widget build(BuildContext context) => Scaffold(
    backgroundColor: const Color.fromRGBO(19, 22, 41, 1),
    appBar: AppBar(
      centerTitle: true,
      title: const Text('Clubs'),
        backgroundColor: const Color.fromRGBO(19, 22, 41, 1),
    ),
    body: ListView(
      children: <Widget>[
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Clubs(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                      children: const <Widget>[
                    Text("Club", style: TextStyle(
                        fontSize: 20.0,
                        color: Color.fromRGBO(255, 255, 255, 1),
                    )),
                  ]),
                  const SizedBox(height: 30 ,),
                  Row(
                      children: const <Widget>[
                        Text("Long Description about the club" ,
                        style: TextStyle(
                            fontSize: 14.0,
                            color: Color.fromRGBO(255, 255, 255, 1)
                        )),
                  ]),
                ],
              ),
            ),
          ],
        ),],
    ),
  );
}
