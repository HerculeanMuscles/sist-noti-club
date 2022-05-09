import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:admin_sist/page/events.dart';

import '../model/Events.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase. initializeApp();

}

class EventPage extends StatefulWidget {
  const EventPage({Key? key}) : super(key: key);

@override
  State<EventPage> createState() => _EventPageState();
}

class _EventPageState extends State<EventPage> {

  @override
  Widget build(BuildContext context) => MaterialApp(
      home: Scaffold(
    backgroundColor: const Color.fromRGBO(19, 22, 41, 1),
    appBar: AppBar(
      centerTitle: true,
      title: const Text('Events'),
      backgroundColor: const Color.fromRGBO(19, 22, 41, 1),
    ),
    body: ListView(
      children: <Widget>[
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const EventForm()),
              );
            },
                style: ElevatedButton.styleFrom(
                  primary: const Color.fromRGBO(120, 121, 241, 1),
                  padding: const EdgeInsets.symmetric(horizontal: 90, vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                ),),
                child: const Text('Create a new event')),
            const Event(title: "Fes", date: "25 March", imageurl: "assets/fes.jpg",
                description: "Lorem ipsum is a name for a common type of placeholder text. Also known as filler or dummy text, this is simply text copy that serves to fill a space without actually saying anything meaningful. It's essentially nonsense text that still gives an idea of what real words will look like in the final product."
            ),
            const Event(title: "Marrakech", date: "24 Oct", imageurl: "assets/marrakech.jpg",
                description: "Lorem ipsum is a name for a common type of placeholder text. Also known as filler or dummy text, this is simply text copy that serves to fill a space without actually saying anything meaningful. It's essentially nonsense text that still gives an idea of what real words will look like in the final product."
            )
          ],
        ),],

    ),
  )
  );
}

class EventForm extends StatefulWidget {
  const EventForm({Key? key}) : super(key: key);

  @override
  State<EventForm> createState() => _EventFormState();
}

class _EventFormState extends State<EventForm> {

  final controllerTitle = TextEditingController();
  final controllerDate = TextEditingController();
  final controllerDescription= TextEditingController();
  final controllerImage = TextEditingController();

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
                child:  TextField(
                  controller: controllerImage,
                  style: const TextStyle(color: Colors.white),
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue, width: 2.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white, width: 2.0),
                    ),
                    labelText: 'Image',
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
                      final events = Events(title: controllerTitle.text, date: controllerDate.text
                          , description: controllerDescription.text, image: controllerImage.text,);
                      Navigator.pop(context);

                      createEvents(events);
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
  Future createEvents(Events events) async{
    final docEvent = FirebaseFirestore.instance.collection("events").doc();
    events.id = docEvent.id;

    final json = events.toJson();
    await docEvent.set(json);
  }
}
