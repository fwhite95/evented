import 'package:csc413termprojectfwhite/src/ui/appBar.dart';
import 'package:flutter/material.dart';

class VenuesFollowedPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: MainNavBar(),
      body: Container(
        child: Center(
          child: Text('Followed page'),
        ),
      ),
    );
  }

}