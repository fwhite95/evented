
import 'package:csc413termprojectfwhite/src/blocs/auth_bloc/authentication_bloc.dart';
import 'package:csc413termprojectfwhite/src/blocs/simple_bloc_delegate.dart';
import 'package:csc413termprojectfwhite/src/resources/user_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'src/app.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  BlocSupervisor.delegate = SimpleBlocDelegate();
  final UserRepository userRepository = UserRepository();
  runApp(MyApp(userRepository: userRepository));
//  runApp(
//    BlocProvider(
//      create: (context) => AuthenticationBloc(
//        userRepository: userRepository
//      )..add(AppStarted()),
//      child: MyApp(userRepository: userRepository),
//    ),
//  );
}
