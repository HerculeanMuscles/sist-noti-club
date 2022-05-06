import 'package:flutter/material.dart';
import 'page/event_page.dart';
import 'page/tutor_page.dart';

void main() => runApp(MaterialApp(
  home: Main(),
));

class Main extends StatefulWidget {
  @override
  _MainState createState() => _MainState();
}

class _MainState extends State<Main>{
  int _currentIndex = 0;
  final screens = [
    const EventPage(),
    const TutorPage()
  ];

  @override
  Widget build(BuildContext context) => Scaffold(
    body: IndexedStack(
      index: _currentIndex,
      children: screens,
    ),
    bottomNavigationBar: BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      backgroundColor: Colors.black,
      selectedItemColor: const Color.fromRGBO(255, 255, 255, 1),
      unselectedItemColor: const Color.fromRGBO(255, 255, 255, 69),
      currentIndex: _currentIndex,
      onTap: (value) {
        setState(() => _currentIndex = value);
      },
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.calendar_today_outlined),
          label: 'Event',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.people_outline_rounded),
          label: 'Tutoring',
        ),
      ],
    ),
  );
}

