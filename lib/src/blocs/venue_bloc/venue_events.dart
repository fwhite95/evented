import 'package:csc413termprojectfwhite/src/models/venueModel.dart';
import 'package:equatable/equatable.dart';

abstract class VenueEvent extends Equatable{
  const VenueEvent();

  @override
  List<Object> get props => [];
}

class LoadVenue extends VenueEvent {}

class VenueAdded extends VenueEvent {
  final Venue venue;

  const VenueAdded(this.venue);

  @override
  List<Object> get props => [venue];

  @override
  String toString() {
    return 'VenueAdded {venue: $venue }';
  }
}

class UpdateVenue extends VenueEvent {
  final Venue venue;

  const UpdateVenue(this.venue);

  @override
  List<Object> get props => [venue];

  @override
  String toString() {
    return 'VenueUpdated {venue: $venue }';
  }
}

class VenueDeleted extends VenueEvent {
  final Venue venue;

  const VenueDeleted(this.venue);

  @override
  List<Object> get props => [venue];

  @override
  String toString() {
    return 'VenueDeleted {venue: $venue }';
  }
}

class VenuesUpdated extends VenueEvent{
  final List<Venue> venues;

  const VenuesUpdated(this.venues);

  @override
  List<Object> get props => [venues];
}

class ClearCompleted extends VenueEvent {}