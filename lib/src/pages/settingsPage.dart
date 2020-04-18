import 'package:csc413termprojectfwhite/src/ui/appBar.dart';
import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {

  SettingsPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: MainNavBar(),
      body: Container(
        child: Center(
          child: Text('Settings page'),
        ),
      ),
    );
  }

}