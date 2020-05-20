
import 'package:csc413termprojectfwhite/src/blocs/auth_bloc/authentication_bloc.dart';
import 'package:csc413termprojectfwhite/src/models/accountModel.dart';
import 'package:csc413termprojectfwhite/src/resources/firebase_repository.dart';
import 'package:csc413termprojectfwhite/src/ui/appBar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';



class SettingsPage extends StatelessWidget {
  final FirebaseRepository _firebaseRepository;
  final Account _account;

  SettingsPage({Key key, @required firebaseRepository, @required account,}) :
      _firebaseRepository = firebaseRepository,
  _account = account,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Settings'),),
      bottomNavigationBar: MainNavBar(account: _account, firebaseRepository: _firebaseRepository,),
      body: ListView(
        children: [
          ListTile(
            title: Text('Account Info'),
          ),
          ListTile(
            title: Text('Settings'),
          ),
          ListTile(
            title: Text('Logout'),
            trailing: IconButton(
              icon: Icon(Icons.exit_to_app),
              onPressed: () {
                BlocProvider.of<AuthenticationBloc>(context).add(
                  LoggedOut(), //check this works
                );
              },
            ),
          ),
        ],
      ),
    );
  }

}