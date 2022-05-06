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
          children: const <Widget>[
            Tutors(title: "Science", time: "25 Dec - 26 Nov", description: "Lorem ipsum is a name for a common type of placeholder text. Also known as filler or dummy text, this is simply text copy that serves to fill a space without actually saying anything meaningful. It's essentially nonsense text that still gives an idea of what real words will look like in the final product."),
            Tutors(title: "Math", time: "25 Dec - 26 Nov", description: "Lorem ipsum is a name for a common type of placeholder text. Also known as filler or dummy text, this is simply text copy that serves to fill a space without actually saying anything meaningful. It's essentially nonsense text that still gives an idea of what real words will look like in the final product."),
            Tutors(title: "Physical", time: "25 Dec - 26 Nov", description: "Lorem ipsum is a name for a common type of placeholder text. Also known as filler or dummy text, this is simply text copy that serves to fill a space without actually saying anything meaningful. It's essentially nonsense text that still gives an idea of what real words will look like in the final product."),
            Tutors(title: "Home Edu", time: "25 Dec - 26 Nov", description: "Lorem ipsum is a name for a common type of placeholder text. Also known as filler or dummy text, this is simply text copy that serves to fill a space without actually saying anything meaningful. It's essentially nonsense text that still gives an idea of what real words will look like in the final product."),

          ],
        ),
      ],
    ),
  );
}
