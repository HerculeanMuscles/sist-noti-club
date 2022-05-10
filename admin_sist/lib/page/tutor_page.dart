import 'package:admin_sist/page/tutor_create.dart';
import 'package:flutter/material.dart';
import 'package:admin_sist/widgets/tutor_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/tutor.dart';



class TutorPage extends StatefulWidget {
  const TutorPage({Key? key}) : super(key: key);

  @override
  State<TutorPage> createState() => _TutorPageState();
}

class _TutorPageState extends State<TutorPage> {
  @override
  Widget build(BuildContext context) => MaterialApp(
  home:Scaffold(
  backgroundColor: const Color.fromRGBO(19, 22, 41, 1),
  appBar: AppBar(
  centerTitle: true,
  title: const Text('Tutoring'),
  backgroundColor: const Color.fromRGBO(19, 22, 41, 1),
  ),
    body: Column(
      children: [
        ElevatedButton(onPressed: () {
  Navigator.push(
  context,
  MaterialPageRoute(builder: (context) => const TutorForm()),
  );
  },
      style: ElevatedButton.styleFrom(
        primary: const Color.fromRGBO(120, 121, 241, 1),
        padding: const EdgeInsets.symmetric(horizontal: 90, vertical: 12),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),),
      child: const Text('Create tutoring event')),
        Flexible(
          child: StreamBuilder<List<Tutor>>(
            stream: readTutor(),
            builder: (context, snapshot) {

              if (snapshot.hasError) {
                return Text('Something is wrong! ${snapshot.error}');
              }
              else if (snapshot.hasData) {
                final tutors = snapshot.data!;
                return ListView(
                  children:
                  tutors.map(buildTutor).toList(),

                );
            }
              else {
                return const Center(child: CircularProgressIndicator(),);
              }
          }
          ),
        ),
      ],
    ),
  )
  );
  Widget buildTutorB(Tutor tutor) => ListTile(
    leading: Text(tutor.title),
    title: Text(tutor.date),
    subtitle: Text(tutor.description),
  );

  Widget buildTutor(Tutor tutor) => Tutors(
      title: tutor.title, date: tutor.date,
      description: tutor.description);

  Stream<List<Tutor>> readTutor() => FirebaseFirestore.instance
      .collection("tutoring")
      .snapshots()
      .map((snapshot) =>
      snapshot.docs.map((doc) => Tutor.fromJson(doc.data())).toList());

}