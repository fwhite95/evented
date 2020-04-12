import 'package:csc413termprojectfwhite/src/blocs/login_bloc/login_bloc.dart';
import 'package:csc413termprojectfwhite/src/blocs/login_bloc/login_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GoogleLoginButton extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return RaisedButton.icon(
        onPressed: () {
          BlocProvider.of<LoginBloc>(context).add(
            LoginWithGooglePressed(),
          );
        },
        icon: Icon(Icons.g_translate,),  //Todo: change icon
        label: Text('Sign in with Google'),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
    );
  }
}