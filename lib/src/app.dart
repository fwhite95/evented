import 'package:csc413termprojectfwhite/src/blocs/account_bloc/account_bloc.dart';
import 'package:csc413termprojectfwhite/src/blocs/auth_bloc/authentication_bloc.dart';
import 'package:csc413termprojectfwhite/src/blocs/navigation_bloc/navigation_bloc.dart';
import 'package:csc413termprojectfwhite/src/blocs/venue_bloc/venue_bloc.dart';
import 'package:csc413termprojectfwhite/src/blocs/venue_bloc/venue_events.dart';
import 'package:csc413termprojectfwhite/src/pages/homePage.dart';
import 'package:csc413termprojectfwhite/src/pages/login/loginPage.dart';
import 'package:csc413termprojectfwhite/src/pages/login/splash_screen.dart';
import 'package:csc413termprojectfwhite/src/resources/firebase_repository.dart';
import 'package:csc413termprojectfwhite/src/resources/user_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyApp extends StatelessWidget {
  final UserRepository _userRepository;
  final FirebaseRepository _firebaseRepository;

  MyApp({Key key, @required UserRepository userRepository,
  @required FirebaseRepository firebaseRepository})
      : assert(userRepository != null),
        _userRepository = userRepository,
        _firebaseRepository = firebaseRepository,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthenticationBloc>(
          create: (context) {
            return AuthenticationBloc(
              userRepository: UserRepository(),
              firebaseRepository: FirebaseRepository()
            )..add(AppStarted());
          },
        ),
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
                firebaseRepository: _firebaseRepository,
              );
            }
            if (state is Authenticated) {
              return HomePage(name: state.displayName, firebaseRepository: _firebaseRepository, account: state.account,);
            }
            return Container(
              child: Scaffold(
                body: Center(
                  child: Text("HELP"),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
