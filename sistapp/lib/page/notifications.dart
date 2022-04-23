import 'package:flutter/material.dart';

class Notifications extends StatefulWidget {
  final Widget child;

  const Notifications({Key? key, required this.child}) : super(key: key);

  @override
  _NotificationsState createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Card(
          color: const Color.fromRGBO(34, 38, 60, 1),
          child:
            Container(
              padding: const EdgeInsets.all(20.0),
              child: widget.child,
            ),
      ),
      ]
    );
  }
}
