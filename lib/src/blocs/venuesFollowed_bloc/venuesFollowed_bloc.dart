import 'dart:async';

import 'package:csc413termprojectfwhite/src/blocs/venuesFollowed_bloc/venuesFollowed_events.dart';
import 'package:csc413termprojectfwhite/src/blocs/venuesFollowed_bloc/venuesFollowed_states.dart';
import 'package:csc413termprojectfwhite/src/resources/firebase_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

class VenueFollowedBloc extends Bloc<VenueFollowedEvent, VenueFollowedState> {
  final FirebaseRepository _firebaseRepository;


  VenueFollowedBloc({@required FirebaseRepository venuesRepository})
      : assert (venuesRepository != null),
        _firebaseRepository = venuesRepository;

  @override
  VenueFollowedState get initialState => VenueFollowedLoading();

  @override
  Stream<VenueFollowedState> mapEventToState(VenueFollowedEvent event) async*{
    if(event is VenuesFollowedLoadSuccessEvent){
      yield* _mapLoadVenueFollowedToState(event);
    } else if(event is VenuesUnFollowedEvent) {
      //yield* _mapLoggedOutToState();
    }
  }

  Stream<VenueFollowedState> _mapLoadVenueFollowedToState(VenuesFollowedLoadSuccessEvent event) async* {
    yield VenueFollowedLoaded(await _firebaseRepository.venuesFollowed(event.venuesFollowed));
  }


}