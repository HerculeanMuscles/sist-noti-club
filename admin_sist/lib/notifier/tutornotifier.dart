import 'dart:collection';

import 'package:admin_sist/model/tutor.dart';
import 'package:flutter/cupertino.dart';

class TutorNotifier with ChangeNotifier {
  List<Tutor> _tutorList = [];
  Tutor _currentTutor;

  UnmodifiableListView<Tutor> get tutorList =>
      UnmodifiableListView(_tutorList);

  Tutor get currentTutor => _currentTutor;

  set tutorList(List<Tutor> tutorlist) {
    _tutorList = tutorlist;
    notifyListeners();
  }

  set currentTutor(Tutor tutor) {
    _currentTutor = tutor;
    notifyListeners()
  }
}