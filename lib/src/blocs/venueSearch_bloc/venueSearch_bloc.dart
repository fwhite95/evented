import 'dart:async';
import 'package:csc413termprojectfwhite/src/blocs/venueSearch_bloc/venueSearch_event.dart';
import 'package:csc413termprojectfwhite/src/blocs/venueSearch_bloc/venueSearch_state.dart';
import 'package:csc413termprojectfwhite/src/resources/firebase_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rxdart/rxdart.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  FirebaseRepository _firebaseRepository;

  SearchBloc({@required firebaseRepository})
  : assert(firebaseRepository != null),
  _firebaseRepository = firebaseRepository;

  @override
  SearchState get initialState => SearchEmpty();

  @override
  Stream<SearchState> transformEvents(
      Stream<SearchEvent> events,
      Stream<SearchState> Function(SearchEvent event) next,
      ) {
    final nonDebounceStream = events.where((event) {
      return (event is! SearchChanged);
    });
    final debounceStream = events.where((event) {
      return (event is SearchChanged);
    }).debounceTime(Duration(milliseconds: 300));
    return super.transformEvents(
      nonDebounceStream.mergeWith([debounceStream]),
      next,
    );
  }

  @override
  Stream<SearchState> mapEventToState(SearchEvent event) async*{
    if(event is SearchChanged){
      yield* _mapSearchChangedToState(event.search);
    }else if(event is SearchAccountUpdate){
      yield* _mapSearchAccountUpdateToState(event);
    }
  }

  Stream<SearchState> _mapSearchAccountUpdateToState(SearchAccountUpdate event) async*{
    _firebaseRepository.updateAccount(event.account);
    yield SearchLoaded(_firebaseRepository.getSearchResultsFromProvider(event.search));
  }

  Stream<SearchState> _mapSearchChangedToState(String search) async* {
    yield SearchLoading();
    try{
      List<dynamic> searchResults =
        _firebaseRepository.getSearchResultsFromProvider(search);

      yield SearchLoaded(searchResults);
    }catch(_){
      yield SearchLoadFailure();
    }
  }
}