import 'package:csc413termprojectfwhite/src/blocs/account_bloc/account_bloc.dart';
import 'package:csc413termprojectfwhite/src/blocs/account_bloc/account_event.dart';
import 'package:csc413termprojectfwhite/src/blocs/auth_bloc/authentication_bloc.dart';
import 'package:csc413termprojectfwhite/src/blocs/venue_bloc/venue_bloc.dart';
import 'package:csc413termprojectfwhite/src/blocs/venue_bloc/venue_events.dart';
import 'package:csc413termprojectfwhite/src/pages/login/loginPage.dart';
import 'package:csc413termprojectfwhite/src/pages/login/splash_screen.dart';
import 'package:csc413termprojectfwhite/src/pages/venuePage.dart';
import 'package:csc413termprojectfwhite/src/resources/firebase_account_repository.dart';
import 'package:csc413termprojectfwhite/src/resources/firebase_venues_repository.dart';
import 'package:csc413termprojectfwhite/src/resources/user_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyApp extends StatelessWidget {
  final UserRepository _userRepository;
  final FirebaseAccountRepository _accountRepository;

  MyApp({Key key, @required UserRepository userRepository,
  @required FirebaseAccountRepository accountRepository})
      : assert(userRepository != null),
        _userRepository = userRepository,
        _accountRepository = accountRepository,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthenticationBloc>(
          create: (context) {
            return AuthenticationBloc(
              userRepository: UserRepository(),
            )..add(AppStarted());
          },
        ),
        BlocProvider<VenueBloc>(
          create: (context) {
            return VenueBloc(
              venuesRepository: FirebaseVenuesRepository(),
            )..add(LoadVenue());
          },
        ),
        BlocProvider<AccountBloc>(
          create: (context) {
            return AccountBloc(
              accountRepository: FirebaseAccountRepository(),
            );
          },
        ),
      ],
      child: MaterialApp(
        home: BlocBuilder<AuthenticationBloc, AuthenticationState>(
          builder: (context, state) {
            if (state is Uninitialized) {
              return SplashScreen();
            }
            if (state is Unauthenticated) {
              return LoginScreen(
                userRepository: _userRepository,
                accountRepository: _accountRepository,
              );
            }
            if (state is Authenticated) {
              return VenuePage(name: state.displayName);
            }
            return Container(
              child: Center(
                child: Text("HELP"),
              ),
            );
          },
        ),
      ),
    );
  }
}
