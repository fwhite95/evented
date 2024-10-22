//Build a homepage

import 'package:csc413termprojectfwhite/src/blocs/account_bloc/account_bloc.dart';
import 'package:csc413termprojectfwhite/src/blocs/navigation_bloc/navigation_state.dart';
import 'package:csc413termprojectfwhite/src/blocs/navigation_bloc/navigation_bloc.dart';
import 'package:csc413termprojectfwhite/src/pages/search/searchPage.dart';
import 'package:csc413termprojectfwhite/src/pages/settingsPage.dart';
import 'package:csc413termprojectfwhite/src/pages/venuePage.dart';
import 'package:csc413termprojectfwhite/src/pages/venuesFollowedPage.dart';
import 'package:csc413termprojectfwhite/src/resources/firebase_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:csc413termprojectfwhite/src/models/accountModel.dart';

import 'eventsFollowedPage.dart';

class HomePage extends StatelessWidget {
  final FirebaseRepository _firebaseRepository;
  final Account _account;

  HomePage(
      {Key key,
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
      ],
      child: MaterialApp(
        home: BlocBuilder<NavigationBloc, NavigationState>(
          builder: (context, state) {
            if (state is NavigationHomePageState) {
              return EventsFollowedPage(account: _account, firebaseRepository: _firebaseRepository,);
            }
            if (state is NavigationSettingsPageState) {
              return SettingsPage(account: _account, firebaseRepository: _firebaseRepository,);
            }
            if (state is NavigationVenuePageState) {
              return VenuePage(firebaseRepository: _firebaseRepository, account: _account,);
            }
            if (state is NavigationFollowedPageState) {
              return VenuesFollowedPage(
                  firebaseRepository: _firebaseRepository, account: _account,);
            }
            if (state is NavigationSearchPageState) {
              return SearchPage(account: _account, firebaseRepository: _firebaseRepository,);
            }
            return Container(
              child: Text('Help :D'),
            );
          },
        ),
      ),
    );
  }
}


