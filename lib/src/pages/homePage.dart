//Build a homepage
//Todo: Displays events that are followed
//Todo: displays events by data of occurrence

import 'package:csc413termprojectfwhite/src/blocs/auth_bloc/authentication_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class HomePage extends StatelessWidget{
 final String name;

 HomePage({Key key, @required this.name}) : super(key: key);

 @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Page"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.exit_to_app),
            onPressed: () {
              BlocProvider.of<AuthenticationBloc>(context).add(
                LoggedOut(),
              );
            },
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Center(child: Text("Welcome $name"),)
        ],
      ),
    );
  }
}

Widget appBar() {
  return BottomAppBar(
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        IconButton(icon: Icon(Icons.event),),
        IconButton(icon: Icon(Icons.search),),
        IconButton(icon: Icon(Icons.home),),
        IconButton(icon: Icon(Icons.favorite),),
        IconButton(icon: Icon(Icons.settings),),
      ],
    ),
  );
}
