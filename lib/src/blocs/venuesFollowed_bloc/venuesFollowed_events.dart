import 'package:csc413termprojectfwhite/src/models/venueModel.dart';
import 'package:equatable/equatable.dart';

abstract class VenueFollowedEvent extends Equatable{
  const VenueFollowedEvent();

  @override
  List<Object> get props => [];
}

class VenuesFollowedLoadSuccessEvent extends VenueFollowedEvent {
  final List<String> venuesFollowed;

  const VenuesFollowedLoadSuccessEvent({this.venuesFollowed});

  @override
  List<Object> get props => [venuesFollowed];
}

//class VenuesFollowedUpdatedEvent extends VenueFollowedEvent{
//  final List<String> venuesFollowed;
//
//  const VenuesFollowedUpdatedEvent(this.venuesFollowed);
//
//  @override
//  List<Object> get props => [venuesFollowed];
//}

class VenuesUnFollowedEvent extends VenueFollowedEvent {}

class GoToVenuePageEvent extends VenueFollowedEvent {

}

