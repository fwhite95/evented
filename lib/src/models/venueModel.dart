import 'package:csc413termprojectfwhite/src/entities/venue_entity.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import 'eventModel.dart';

class Venue extends Equatable{
  final String address;
  final String id;
  final String label;
  final String name;
  final List<Events> events;

  Venue(this.address, this.id, this.label, this.name, this.events);

  Venue copyWith({String address, String id, String label,
    String name, List<Events> events}){
    return Venue(
      address ?? this.address,
      id ?? this.id,
      label ?? this.label,
      name ?? this.name,
      events ?? this.events,
    );
  }

  @override
  List<Object> get props => [address, id, label, name, events];

  @override
  String toString() {
    return 'Venue{address: $address, id: $id, '
        'label: $label, name: $name, events: $events}';
  }

  VenueEntity toEntity() {
    return VenueEntity(address, id, label, name, events);
  }

  static Venue fromEntity(VenueEntity entity){
    return Venue(
      entity.address,
      entity.id,
      entity.label,
      entity.name,
      entity.events
    );
  }

}