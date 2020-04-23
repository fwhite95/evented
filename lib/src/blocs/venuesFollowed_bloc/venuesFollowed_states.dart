import 'package:csc413termprojectfwhite/src/models/venueModel.dart';
import 'package:equatable/equatable.dart';

abstract class VenueFollowedState extends Equatable{
  const VenueFollowedState();

  @override
  List<Object> get props => [];
}

class VenueFollowedLoading extends VenueFollowedState{}

class VenueFollowedLoaded extends VenueFollowedState {
  final List<Venue> venues;

  const VenueFollowedLoaded([this.venues = const []]);

  @override
  List<Object> get props => [venues];

  @override
  String toString() {
    return 'VenueFollowedLoaded { venues: $venues }';
  }
}

class VenueFollowedLoadFailure extends VenueFollowedState {}