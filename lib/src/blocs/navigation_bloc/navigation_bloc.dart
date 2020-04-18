import 'package:csc413termprojectfwhite/src/blocs/navigation_bloc/navigation_state.dart';
import 'package:csc413termprojectfwhite/src/pages/homePage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'navigation_event.dart';

class NavigationBloc extends Bloc<NavigationEvent, NavigationState> {

  NavigationBloc();

  @override
 NavigationState get initialState => NavigationHomePageState();

  @override
  Stream<NavigationState> mapEventToState(NavigationEvent event) async* {
    if(event is NavigateToHomeEvent){
      yield* _mapHomePageToState();
    } else if(event is NavigateToSettingsPageEvent){
      yield* _mapSettingsPageToState();
    }else if(event is NavigateToSearchPageEvent){
      yield* _mapSearchPageToState();
    }else if(event is NavigateToVenuePageEvent){
      yield* _mapVenuePageToState();
    }else if(event is NavigateToFollowedPageEvent){
      yield* _mapFollowedPageToState();
    }
  }

  Stream<NavigationState> _mapHomePageToState() async*{
    yield NavigationHomePageState();
  }

  Stream<NavigationState> _mapSettingsPageToState() async*{
    yield NavigationSettingsPageState();
  }

  Stream<NavigationState> _mapFollowedPageToState() async*{
    yield NavigationFollowedPageState();
  }

  Stream<NavigationState> _mapVenuePageToState() async*{
    yield NavigationVenuePageState();
  }

  Stream<NavigationState> _mapSearchPageToState() async*{
    yield NavigationSearchPageState();
  }

}
