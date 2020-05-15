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
    if(event is VenuesFollowedLoadEvent){
      try{
        yield* _mapLoadVenueFollowedToState(event);
      }catch(_){
        print('Error: VenueFollowedBloc');
        yield VenueFollowedLoadFailure();
      }
    }
  }

  Stream<VenueFollowedState> _mapLoadVenueFollowedToState(VenuesFollowedLoadEvent event) async* {
    //_firebaseRepository.venuesFollowedFromProvider(event.account);
    yield VenueFollowedLoaded(_firebaseRepository.venuesFollowedFromProvider(event.account));
  }


}