import 'package:csc413termprojectfwhite/src/models/venueModel.dart';
import 'package:equatable/equatable.dart';

abstract class VenueState extends Equatable{
  const VenueState();

  @override
  List<Object> get props => [];
}

class VenueLoading extends VenueState{}

class VenueLoaded extends VenueState {
  final List<Venue> venues;

  const VenueLoaded([this.venues = const []]);

  @override
  List<Object> get props => [venues];

  @override
  String toString() {
    return 'VenueLoaded { venues: $venues }';
  }
}

class VenueLoadFailure extends VenueState {}