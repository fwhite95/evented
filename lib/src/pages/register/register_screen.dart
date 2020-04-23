import 'package:csc413termprojectfwhite/src/blocs/register_bloc/register_bloc.dart';
import 'package:csc413termprojectfwhite/src/pages/register/register_form.dart';
import 'package:csc413termprojectfwhite/src/resources/firebase_account_repository.dart';
import 'package:csc413termprojectfwhite/src/resources/firebase_repository.dart';
import 'package:csc413termprojectfwhite/src/resources/user_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterScreen extends StatelessWidget {
  final UserRepository _userRepository;
  final FirebaseRepository _firebaseRepository;

  RegisterScreen({Key key, @required UserRepository userRepository,
  @required FirebaseRepository firebaseRepository})
  : assert(userRepository != null),
  _userRepository = userRepository,
  _firebaseRepository = firebaseRepository,
  super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Register'),),
      body: Center(
        child: BlocProvider<RegisterBloc>(
          create: (context) => RegisterBloc(userRepository: _userRepository,
          accountRepository: _firebaseRepository),
          child: RegisterForm(),
        ),
      ),
    );
  }
}