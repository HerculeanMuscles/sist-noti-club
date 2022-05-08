import 'package:flutter/material.dart';
import 'package:admin_sist/page/tutoring.dart';
import 'package:cloud_firestore/cloud_firestore.dart';



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

class TutorForm extends StatefulWidget {
  const TutorForm({Key? key}) : super(key: key);

  @override
  State<TutorForm> createState() => _TutorFormState();
}

class _TutorFormState extends State<TutorForm> {
  final controllerTitle = TextEditingController();
  final controllerDate = TextEditingController();
  final controllerDescription= TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(19, 22, 41, 1),
      appBar: AppBar(
        centerTitle: true,
        title: const Text(''),
        backgroundColor: const Color.fromRGBO(19, 22, 41, 1),
      ),
      body: ListView(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                padding: const EdgeInsets.fromLTRB(10,10,10,10),
                child:  TextField(
                  controller: controllerTitle,
                  style: const TextStyle(color: Colors.white),
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue, width: 2.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white, width: 2.0),
                    ),
                    labelText: 'Title',
                    labelStyle: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(10,10,10,10),
                child: TextField(
                  controller: controllerDescription,
                  style: const TextStyle(color: Colors.white),
                  maxLines: 6,
                  minLines: 1,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue, width: 2.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white, width: 2.0),
                    ),
                    labelText: 'Description',
                    labelStyle: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(10,10,10,10),
                child: TextField(
                  controller: controllerDate,
                  style: const TextStyle(color: Colors.white),
                  minLines: 1,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue, width: 2.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white, width: 2.0),
                    ),
                    labelText: 'Date of event',
                    labelStyle: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(10,10,10,10),
                child: ElevatedButton(
                    onPressed: () {
                      final tutor = Tutor(title: controllerTitle.text, date: controllerDate.text
                          , description: controllerDescription.text);
                      Navigator.pop(context);

                      createTutoring(tutor);
                    },
                    style: ElevatedButton.styleFrom(
                      primary:  const Color.fromRGBO(120, 121, 241, 1),
                      padding:  const EdgeInsets.symmetric(horizontal: 90, vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                    ),
                    child: const Text('Create a new event')),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Future createTutoring(Tutor tutor) async{
    final docTutoring = FirebaseFirestore.instance.collection("tutoring").doc();
    tutor.id = docTutoring.id;

    final json = tutor.toJson();
    await docTutoring.set(json);
  }
}

class Tutor {
  String? id;
  final String title;
  final String date;
  final String description;

  Tutor({
    this.id ='',
    required this.title,
    required this.date,
    required this.description,
});

  Map<String, dynamic> toJson() => {
    'id': id,
    'title': title,
    'date': date,
    'description' : description,
  };

  static Tutor fromJson(Map<String, dynamic> json) => Tutor(
    id: json['id'],
    title: json['title'],
    date: json['date'],
    description: json['description']
  );
}