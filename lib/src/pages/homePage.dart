//Build a homepage
//Todo: Displays events that are followed
//Todo: displays events by data of occurrence

import 'package:csc413termprojectfwhite/src/blocs/account_bloc/account_bloc.dart';
import 'package:csc413termprojectfwhite/src/blocs/account_bloc/account_event.dart';
import 'package:csc413termprojectfwhite/src/blocs/auth_bloc/authentication_bloc.dart';
import 'package:csc413termprojectfwhite/src/blocs/navigation_bloc/navigation_state.dart';
import 'package:csc413termprojectfwhite/src/blocs/navigation_bloc/navigation_bloc.dart';
import 'package:csc413termprojectfwhite/src/blocs/venue_bloc/venue_bloc.dart';
import 'package:csc413termprojectfwhite/src/blocs/venue_bloc/venue_events.dart';
import 'package:csc413termprojectfwhite/src/blocs/venuesFollowed_bloc/venuesFollowed_bloc.dart';
import 'package:csc413termprojectfwhite/src/blocs/venuesFollowed_bloc/venuesFollowed_events.dart';
import 'package:csc413termprojectfwhite/src/blocs/venuesFollowed_bloc/venuesFollowed_states.dart';
import 'package:csc413termprojectfwhite/src/pages/search/searchPage.dart';
import 'package:csc413termprojectfwhite/src/pages/settingsPage.dart';
import 'package:csc413termprojectfwhite/src/pages/venuePage.dart';
import 'package:csc413termprojectfwhite/src/pages/venuesFollowedPage.dart';
import 'package:csc413termprojectfwhite/src/resources/firebase_repository.dart';
import 'package:csc413termprojectfwhite/src/ui/appBar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:csc413termprojectfwhite/src/models/accountModel.dart';

class HomePage extends StatelessWidget {
  final String name;
  final FirebaseRepository _firebaseRepository;
  final Account _account;

  HomePage(
      {Key key,
      @required this.name,
      @required FirebaseRepository firebaseRepository,
      Account account})
      : assert(firebaseRepository != null),
        _account = account,
        _firebaseRepository = firebaseRepository,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<VenueBloc>(
          create: (context) {
            return VenueBloc(
              venuesRepository: FirebaseRepository(),
            )..add(LoadVenue());
          },
        ),
        BlocProvider<AccountBloc>(
          create: (context) {
            return AccountBloc(
              accountRepository: FirebaseRepository(),
            );
          },
        ),
        BlocProvider<NavigationBloc>(
          create: (context) {
            return NavigationBloc();
          },
        ),
        BlocProvider<VenueFollowedBloc>(
          create: (context) {
            return VenueFollowedBloc(venuesRepository: _firebaseRepository)
              ..add(VenuesFollowedLoadEvent(account: _account));
          },
        ),
      ],
      child: MaterialApp(
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
              return VenuePage(
                name: name,
              );
            }
            if (state is NavigationFollowedPageState) {
            return VenuesFollowedPage(
                  name: name, firebaseRepository: _firebaseRepository);
            }
            if (state is NavigationSearchPageState) {
              return SearchPage();
            }
            return HomeScreen(name: name);
          },
        ),
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
