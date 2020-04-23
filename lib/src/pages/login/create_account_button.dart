import 'package:csc413termprojectfwhite/src/pages/register/register_screen.dart';
import 'package:csc413termprojectfwhite/src/resources/firebase_account_repository.dart';
import 'package:csc413termprojectfwhite/src/resources/firebase_repository.dart';
import 'package:csc413termprojectfwhite/src/resources/user_repository.dart';
import 'package:flutter/material.dart';

class CreateAccountButton extends StatelessWidget{
  final UserRepository _userRepository;
  final FirebaseRepository _firebaseRepository;

  CreateAccountButton({Key key, @required UserRepository userRepository,
  @required FirebaseRepository firebaseRepository})
  : assert(userRepository != null),
  _userRepository = userRepository,
  _firebaseRepository = firebaseRepository,
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
            firebaseRepository: _firebaseRepository,
          );
          }),
        );
      },
    );
  }
}