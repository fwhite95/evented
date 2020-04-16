import 'package:csc413termprojectfwhite/src/pages/register/register_screen.dart';
import 'package:csc413termprojectfwhite/src/resources/firebase_account_repository.dart';
import 'package:csc413termprojectfwhite/src/resources/user_repository.dart';
import 'package:flutter/material.dart';

class CreateAccountButton extends StatelessWidget{
  final UserRepository _userRepository;
  final FirebaseAccountRepository _accountRepository;

  CreateAccountButton({Key key, @required UserRepository userRepository,
  @required FirebaseAccountRepository accountRepository})
  : assert(userRepository != null),
  _userRepository = userRepository,
  _accountRepository = accountRepository,
  super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      child: Text('Create an Account'),
      onPressed: () {
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) {
          return RegisterScreen(
            userRepository: _userRepository,
            accountRepository: _accountRepository,
          );
          }),
        );
      },
    );
  }
}