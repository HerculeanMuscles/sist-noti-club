import 'package:flutter/material.dart';
import 'package:admin_sist/page/tutoring.dart';

class TutorPage extends StatefulWidget {
  const TutorPage({Key? key}) : super(key: key);

  @override
  State<TutorPage> createState() => _TutorPageState();
}

class _TutorPageState extends State<TutorPage> {
  @override
  Widget build(BuildContext context) => Scaffold(
  backgroundColor: const Color.fromRGBO(19, 22, 41, 1),
  appBar: AppBar(
  centerTitle: true,
  title: const Text('Tutoring'),
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
            const Tutors(title: "Science", time: "25 Dec - 26 Nov",
                description: "Lorem ipsum is a name for a common type of placeholder text. Also known as filler or dummy text, this is simply text copy that serves to fill a space without actually saying anything meaningful. It's essentially nonsense text that still gives an idea of what real words will look like in the final product."),
            const Tutors(title: "Math", time: "25 Dec - 26 Nov",
                description: "Lorem ipsum is a name for a common type of placeholder text. Also known as filler or dummy text, this is simply text copy that serves to fill a space without actually saying anything meaningful. It's essentially nonsense text that still gives an idea of what real words will look like in the final product."),
            const Tutors(title: "Physical", time: "25 Dec - 26 Nov",
                description: "Lorem ipsum is a name for a common type of placeholder text. Also known as filler or dummy text, this is simply text copy that serves to fill a space without actually saying anything meaningful. It's essentially nonsense text that still gives an idea of what real words will look like in the final product."),
            const Tutors(title: "Home Edu", time: "25 Dec - 26 Nov",
                description: "Lorem ipsum is a name for a common type of placeholder text. Also known as filler or dummy text, this is simply text copy that serves to fill a space without actually saying anything meaningful. It's essentially nonsense text that still gives an idea of what real words will look like in the final product."),

          ],
        ),
      ],
    ),
  );
}



class TutorForm extends StatefulWidget {
  const TutorForm({Key? key}) : super(key: key);

  @override
  State<TutorForm> createState() => _TutorFormState();
}

class _TutorFormState extends State<TutorForm> {
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
                child: const TextField(
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
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
                child: const TextField(
                  style: TextStyle(color: Colors.white),
                  maxLines: 6,
                  minLines: 1,
                  decoration: InputDecoration(
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
                child: const TextField(
                  style: TextStyle(color: Colors.white),
                  minLines: 1,
                  decoration: InputDecoration(
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
                    onPressed: () {},
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
}
