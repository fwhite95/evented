import 'package:csc413termprojectfwhite/src/resources/firebase_account_repository.dart';
import 'package:csc413termprojectfwhite/src/resources/user_repository.dart';
import 'package:equatable/equatable.dart';

abstract class NavigationEvent extends Equatable{
  @override
  List<Object> get props => [];
}

class NavigationPopEvent extends NavigationEvent {}

class NavigateToSearchPageEvent extends NavigationEvent {}

class NavigateToFollowedPageEvent extends NavigationEvent {}

class NavigateToLoginPageEvent extends NavigationEvent {}

class NavigateToHomeEvent extends NavigationEvent{}

class NavigateToVenuePageEvent extends NavigationEvent {}

class NavigateToSettingsPageEvent extends NavigationEvent {}