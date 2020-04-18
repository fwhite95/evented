import 'package:equatable/equatable.dart';

abstract class NavigationState extends Equatable{
  const NavigationState();

  @override
  List<Object> get props => [];
}

class NavigationSettingsPageState extends NavigationState {}

class NavigationHomePageState extends NavigationState {}

class NavigationVenuePageState extends NavigationState {}

class NavigationSearchPageState extends NavigationState {}

class NavigationFollowedPageState extends NavigationState {}

