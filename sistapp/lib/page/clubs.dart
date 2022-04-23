
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Clubs extends StatefulWidget {
  final Widget child;
  const Clubs({Key? key, required this.child}) : super(key: key);

  @override
  _ClubsState createState() => _ClubsState();
}

class _ClubsState extends State<Clubs> {

  @override
  Widget build(BuildContext context) {
    return Column(
        //mainAxisSize: MainAxisSize.max,
        //crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Card(
            margin: const EdgeInsets.all(20),
            color: const Color.fromRGBO(34, 38, 60, 1),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              //crossAxisAlignment: CrossAxisAlignment,
              children: [
                Container(
                  padding: const EdgeInsets.all(40.0),
                  child: widget.child,
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(0, 0, 0, 30),
                  child: ElevatedButton(
                      onPressed: (){},
                      child: const Text('Join'),
                    //Text('Join', style: TextStyle(fontSize: 14.0,)),
                    style: ElevatedButton.styleFrom(
                      primary: const Color.fromRGBO(159, 170, 255, 1),
                      fixedSize: const Size(300, 40),
                      //padding: const EdgeInsets.fromLTRB(10, 16, 10, 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50)),
                    ),
                  ),
                ),
              ],
            )
          ),
        ]
    );
  }
}

