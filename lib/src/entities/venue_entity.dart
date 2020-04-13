
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:csc413termprojectfwhite/src/models/eventModel.dart';
import 'package:equatable/equatable.dart';

class VenueEntity extends Equatable {
  final String address;
  final String id;
  final String label;
  final String name;
  final List<Events> events;

  const VenueEntity(this.address, this.id, this.label, this.name, this.events);

  Map<String, Object> toJson() {
    return {
      "address": address,
      "id": id,
      "label": label,
      "name": name,
      "events": events,
    };
  }

  @override
  List<Object> get props => [address, id, label, name];

  @override
  String toString() {
    return 'VenueEntity{address: $address, id: $id, '
        'label: $label, name: $name}';
  }

  static VenueEntity fromJson(Map<String, Object> json){

    return VenueEntity(
      json['address'] as String,
      json['id'] as String,
      json['label'] as String,
      json['name'] as String,
      json['events'] as List<Events>,
    );
  }

  static VenueEntity fromSnapshot(DocumentSnapshot snapshot){
    return VenueEntity(
      snapshot.data['address'],
      snapshot.data['id'],
      snapshot.data['label'],
      snapshot.data['name'],
      Events.fromSnapshot(snapshot.data['events']),
    );
  }

  //Possibly unused since user cant update venues in DB
  Map<String, Object> toDocument() {
    return {
      "address": address,
      "label": label,
      "name": name,
    };
  }

}