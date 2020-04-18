import 'package:csc413termprojectfwhite/src/blocs/navigation_bloc/navigation_bloc.dart';
import 'package:csc413termprojectfwhite/src/blocs/navigation_bloc/navigation_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainNavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          IconButton(
            icon: Icon(Icons.add_box),
            onPressed: () {
              BlocProvider.of<NavigationBloc>(context)
                  .add(NavigateToVenuePageEvent());
            },
          ),
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              BlocProvider.of<NavigationBloc>(context)
                  .add(NavigateToSearchPageEvent());
            },
          ),
          IconButton(
            icon: Icon(Icons.home),
            onPressed: () {
              BlocProvider.of<NavigationBloc>(context)
                  .add(NavigateToHomeEvent());
            },
          ),
          IconButton(
            icon: Icon(Icons.favorite),
            onPressed: () {
              BlocProvider.of<NavigationBloc>(context)
                  .add(NavigateToFollowedPageEvent());
            },
          ),
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {
              BlocProvider.of<NavigationBloc>(context).add(NavigateToSettingsPageEvent());
            },
          ),
        ],
      ),
    );
  }

}