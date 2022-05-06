import 'package:flutter/material.dart';
import 'package:admin_sist/page/events.dart';

class EventPage extends StatefulWidget {
  const EventPage({Key? key}) : super(key: key);



@override
  State<EventPage> createState() => _EventPageState();
}

class _EventPageState extends State<EventPage> {
  @override
  Widget build(BuildContext context) => Scaffold(
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
            ElevatedButton(onPressed: () {},
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
  );
}
