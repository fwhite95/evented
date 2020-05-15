import 'package:csc413termprojectfwhite/src/models/eventModel.dart';
import 'package:equatable/equatable.dart';

abstract class EventsFollowedState extends Equatable{
  const EventsFollowedState();

  @override
  List<Object> get props => [];
}

class EventsFollowedLoading extends EventsFollowedState{}

class EventsFollowedLoaded extends EventsFollowedState {
  final List<Events> events;

  const EventsFollowedLoaded([this.events = const []]);

  @override
  List<Object> get props => [events];

  @override
  String toString() {
    return 'EventsFollowedLoaded { events: $events }';
  }
}

class EventsFollowedLoadFailure extends EventsFollowedState {}