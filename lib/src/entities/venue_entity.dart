import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class VenueEntity extends Equatable {
  final String address;
  final String id;
  final String label;
  final String name;
  //List<Event> = [];

  const VenueEntity(this.address, this.id, this.label, this.name);

  Map<String, Object> toJson() {
    return {
      "address": address,
      "id": id,
      "label": label,
      "name": name,
    };
  }

  @override
  // TODO: implement props
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
    );
  }

  static VenueEntity fromSnapshot(DocumentSnapshot snapshot){
    return VenueEntity(
      snapshot.data['address'],
      snapshot.data['id'],
      snapshot.data['label'],
      snapshot.data['name'],
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