
import 'package:cloud_firestore/cloud_firestore.dart';

class EventModel{
  Timestamp _date;
  String _name;

  EventModel(event){
    _date = event['date'];
    _name = event['name'];
  }

  //getters
  String get name => _name;
  Timestamp get id => _date;

}