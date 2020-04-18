//#Todo: Login page
//stores user info in database

import 'package:csc413termprojectfwhite/src/blocs/login_bloc/login_bloc.dart';
import 'package:csc413termprojectfwhite/src/resources/firebase_account_repository.dart';
import 'package:csc413termprojectfwhite/src/resources/user_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'login_form.dart';

class LoginScreen extends StatelessWidget {
  final UserRepository _userRepository;
  final FirebaseAccountRepository _accountRepository;


  LoginScreen({Key key, @required UserRepository userRepository,
  @required FirebaseAccountRepository accountRepository})
  : assert(userRepository != null),
  _accountRepository = accountRepository,
  _userRepository = userRepository,
  super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login'),),
      body: BlocProvider<LoginBloc>(
        create: (context) => LoginBloc(userRepository: _userRepository,),
        child: LoginForm(userRepository: _userRepository, accountRepository: _accountRepository,),
      ),
    );
  }
}