import 'package:csc413termprojectfwhite/src/models/accountModel.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

abstract class VenueFollowedEvent extends Equatable{
  const VenueFollowedEvent();

  @override
  List<Object> get props => [];
}

class VenuesFollowedLoadEvent extends VenueFollowedEvent {
  final Account account;

  const VenuesFollowedLoadEvent({@required this.account});

  @override
  List<Object> get props => [account];
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

