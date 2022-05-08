import 'package:cloud_firestore/cloud_firestore.dart';

class Tutor {
  String title;
  String date;
  String description;

  Tutor.fromMap(Map<String, dynamic> data){
    title = data['title'] ;
    date = data['date'] ;
    description = data['description'] ;
  }
}