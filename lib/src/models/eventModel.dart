import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class Events extends Equatable {
  final String name;
  final Timestamp date;

  Events(this.name, this.date);

  Events copyWith({String name, Timestamp date}) {
    return Events(
      name ?? this.name,
      date ?? this.date,
    );
  }

  @override
  List<Object> get props => [name, date];

  @override
  String toString() {
    return 'Venue{address: $name, date: $date}';
  }

  static List<Events> fromSnapshot(List<dynamic> events){
    List<Events> temp = [];
    for(int i = 0; i < events.length; i++){
      temp.add(Events(events[i]['name'], events[i]['date']));
    }
    return temp;
  }
}

