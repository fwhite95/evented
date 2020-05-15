import 'package:csc413termprojectfwhite/src/blocs/eventsFollowed_bloc/eventsFollowed_events.dart';
import 'package:csc413termprojectfwhite/src/blocs/eventsFollowed_bloc/eventsFollowed_state.dart';
import 'package:csc413termprojectfwhite/src/resources/firebase_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EventsFollowedBloc extends Bloc<EventsFollowedEvent, EventsFollowedState> {
 final FirebaseRepository _firebaseRepository;

 EventsFollowedBloc({@required FirebaseRepository firebaseRepository})
 : assert(firebaseRepository != null),
 _firebaseRepository = firebaseRepository;

  @override
  EventsFollowedState get initialState => EventsFollowedLoading();

  @override
  Stream<EventsFollowedState> mapEventToState(EventsFollowedEvent event) async*{
    if(event is GetEventsFollowed){
      try{
        yield* _mapGetEventsFollowedToState(event);
      }catch(_){
        yield EventsFollowedLoadFailure();
      }
    }
  }

  Stream<EventsFollowedState> _mapGetEventsFollowedToState(GetEventsFollowed event) async*{
    yield EventsFollowedLoaded(_firebaseRepository.eventsFollowedFromProvider(event.account));
  }

}