import 'dart:async';

import 'package:csc413termprojectfwhite/src/blocs/venue_bloc/venue_events.dart';
import 'package:csc413termprojectfwhite/src/blocs/venue_bloc/venue_states.dart';
import 'package:csc413termprojectfwhite/src/resources/firebase_repository.dart';
import 'package:csc413termprojectfwhite/src/resources/firebase_venues_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class VenueBloc extends Bloc<VenueEvent, VenueState> {
  final FirebaseRepository _venuesRepository;
  StreamSubscription _venuesSubscription;

  VenueBloc({@required FirebaseRepository venuesRepository})
  : assert (venuesRepository != null),
  _venuesRepository = venuesRepository;

  @override
  VenueState get initialState => VenueLoading();

  @override
  Stream<VenueState> mapEventToState(VenueEvent event) async*{
    if(event is LoadVenue){
      yield* _mapLoadVenueToState();
    } else if(event is VenuesUpdated) {
      yield* _mapVenueUpdateToState(event);
    }
  }

  Stream<VenueState> _mapLoadVenueToState() async* {
    _venuesSubscription?.cancel();
    _venuesSubscription = _venuesRepository.venues().listen(
        (venues) => add(VenuesUpdated(venues)),
    );
  }

  Stream<VenueState> _mapVenueUpdateToState(VenuesUpdated event) async* {
    yield VenueLoaded(event.venues);
  }

  @override
  Future<void> close() {
    _venuesSubscription?.cancel();
    return super.close();
  }

}