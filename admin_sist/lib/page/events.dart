import 'package:flutter/material.dart';

class Event extends StatefulWidget {
  final String title;
  final String date;
  final String imageurl;
  final String description;

  const Event({Key? key, required this.title, required this.date, required this.imageurl, required this.description,}) : super(key: key);

  @override
  State<Event> createState() => _EventState();
}

class _EventState extends State<Event> {
  @override
  Widget build(BuildContext context) {
    return Card(
        margin: const EdgeInsets.all(20),
        color: const Color.fromRGBO(34, 38, 60, 1),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          //crossAxisAlignment: CrossAxisAlignment,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image(image: AssetImage(/*Insert image*/ widget.imageurl), fit: BoxFit.fill, height: 200,
            ),
            Container(
              padding: EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(/*"Event"*/widget.title
                    ,style: const TextStyle(
                      color: Colors.white, fontSize: 20,
                    ), textAlign: TextAlign.start, ),
                  Card(
                    color: const Color.fromRGBO(95, 112, 255, 1.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                      child: Text(/*"date"*/ widget.date
                        ,style: const TextStyle(
                          color: Colors.white, fontSize: 10,
                        ), textAlign: TextAlign.end,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: Text(widget.description /*Description*/,
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                )),
            Container(
              margin: const EdgeInsets.fromLTRB(0, 0, 0, 30),
            ),
          ],
        )
    );
  }
}


