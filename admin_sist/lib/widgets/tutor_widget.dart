import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Tutors extends StatefulWidget {
  final String title;
  final String date;
  final String description;

  const Tutors({Key? key, required this.title, required this.date,
    required this.description,}) : super(key: key);

  @override
  State<Tutors> createState() => _TutorsState();
}

class _TutorsState extends State<Tutors> {
  @override
  Widget build(BuildContext context) {
    return Card(
        margin: const EdgeInsets.fromLTRB(10,10,10,10),
        color: const Color.fromRGBO(34, 38, 60, 1),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          //crossAxisAlignment: CrossAxisAlignment,
          children: [
            Container(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                   Row(
                     children: <Widget> [
                       IconButton(onPressed: () async {
                         var collection = FirebaseFirestore.instance.collection('tutoring');
                         await collection.doc().delete();
                         /*final docTutor = FirebaseFirestore.instance
                             .collection('tutoring')
                             .doc();
                         docTutor.delete();*/
                       }, icon: const Icon(
                           Icons.delete_outline,
                       color: Colors.white,)),
                       Text(widget.title /*"Tutor Event"*/
                         ,style: const TextStyle(
                        color: Colors.white, fontSize: 20,
                  ), textAlign: TextAlign.start, ),
                     ],
                   ),
                  Card(
                    color: const Color.fromRGBO(95, 112, 255, 1.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                      child: Text(widget.date /*"date"*/
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
                child: Text(widget.description
                  ,style: const TextStyle(
                    color: Colors.white,
                  ),
                )),
            Container(
              margin: const EdgeInsets.fromLTRB(0, 0, 0, 20),
            ),
          ],
        )
    );
  }
}
