import 'package:csc413termprojectfwhite/src/entities/venue_entity.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

//Todo: check of venue model is needed
//May not need a venue model
//Model is modified in app but venue/events are not modified by user

class Venue extends Equatable{
  final String address;
  final String id;
  final String label;
  final String name;
  // List<EventModel> _eventsList = [];

  Venue(this.address, this.id, this.label, this.name);

  Venue copyWith({String address, String id, String label, String name}){
    return Venue(
      address ?? this.address,
      id ?? this.id,
      label ?? this.label,
      name ?? this.name,
    );
  }

  @override
  List<Object> get props => [address, id, label, name];

  @override
  String toString() {
    return 'Venue{address: $address, id: $id, '
        'label: $label, name: $name}';
  }

  VenueEntity toEntity() {
    return VenueEntity(address, id, label, name);
  }

  static Venue fromEntity(VenueEntity entity){
    return Venue(
      entity.address,
      entity.id,
      entity.label,
      entity.name,
    );
  }

}