//Build a homepage
//Todo: Displays events that are followed
//Todo: displays events by data of occurrence

import 'package:csc413termprojectfwhite/src/blocs/auth_bloc/authentication_bloc.dart';
import 'package:csc413termprojectfwhite/src/blocs/navigation_bloc/navigation_state.dart';
import 'package:csc413termprojectfwhite/src/blocs/navigation_bloc/navigation_bloc.dart';
import 'package:csc413termprojectfwhite/src/blocs/venuesFollowed_bloc/venuesFollowed_bloc.dart';
import 'package:csc413termprojectfwhite/src/blocs/venuesFollowed_bloc/venuesFollowed_events.dart';
import 'package:csc413termprojectfwhite/src/blocs/venuesFollowed_bloc/venuesFollowed_states.dart';
import 'package:csc413termprojectfwhite/src/models/accountModel.dart';
import 'package:csc413termprojectfwhite/src/pages/search/searchPage.dart';
import 'package:csc413termprojectfwhite/src/pages/settingsPage.dart';
import 'package:csc413termprojectfwhite/src/pages/venuePage.dart';
import 'package:csc413termprojectfwhite/src/pages/venuesFollowedPage.dart';
import 'package:csc413termprojectfwhite/src/resources/firebase_repository.dart';
import 'package:csc413termprojectfwhite/src/ui/appBar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  final String name;
  final FirebaseRepository _firebaseRepository;

  HomePage({Key key, @required this.name, @required FirebaseRepository firebaseRepository }) :
      assert(firebaseRepository != null),
        _firebaseRepository = firebaseRepository,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: BlocBuilder<NavigationBloc, NavigationState>(
        builder: (context, state) {
          if (state is NavigationHomePageState) {
            return HomeScreen(
              name: name,
            );
          }
          if (state is NavigationSettingsPageState) {
            return SettingsPage();
          }
          if (state is NavigationVenuePageState) {
            return VenuePage(name: name,);
          }
          if (state is NavigationFollowedPageState) {
            //final account =  _firebaseRepository.getAccount(name);
            //return VenuesFollowedPage(name: name, firebaseRepository: _firebaseRepository);
            return BlocProvider<VenueFollowedBloc>(
              create: (context) => VenueFollowedBloc(venuesRepository: _firebaseRepository),
              child: VenuesFollowedPage(name: name, firebaseRepository: _firebaseRepository),
            );
          }
          if (state is NavigationSearchPageState) {
            return SearchPage();
          }
          return HomeScreen(name: name);
        },
      ),
    );
  }
}


class HomeScreen extends StatelessWidget {
  final String name;

  HomeScreen({Key key, @required this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Page"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.exit_to_app),
            onPressed: () {
              BlocProvider.of<AuthenticationBloc>(context).add(
                LoggedOut(),
              );
            },
          ),
        ],
      ),
      bottomNavigationBar: MainNavBar(),
      body: Container(
        child: Center(
          child: Text('Welcome: $name'),
        ),
      ),
    );
  }
}
