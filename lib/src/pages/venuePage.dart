import 'package:csc413termprojectfwhite/src/blocs/auth_bloc/authentication_bloc.dart';
import 'package:csc413termprojectfwhite/src/blocs/venue_bloc/venue_bloc.dart';
import 'package:csc413termprojectfwhite/src/blocs/venue_bloc/venue_states.dart';
import 'package:csc413termprojectfwhite/src/models/eventModel.dart';
import 'package:csc413termprojectfwhite/src/models/venueModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class VenuePage extends StatelessWidget{
  final String name;

  VenuePage({Key key, @required this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<VenueBloc, VenueState>(
      builder: (context, state) {
        if(state is VenueLoading){
          return Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
        final venues = (state as VenueLoaded).venues;
        return Scaffold(
          appBar: AppBar(
            title: Text("Home Page"),
            actions: <Widget>[
              IconButton(
                icon: Icon(Icons.exit_to_app),
                onPressed: () {
                  BlocProvider.of<AuthenticationBloc>(context).add(
                    LoggedOut(), //check this works
                  );
                },
              ),
            ],
          ),
          body: Padding(
            padding: EdgeInsets.all(16),
            child: ListView.builder(
              //TODO: Work on ui for the venue Tiles
              itemCount: venues.length,
              itemBuilder: (context, index) {
                return VenueExpansionTile(
                  name: venues[index].name,
                  label: venues[index].label,
                  events: venues[index].events,
                );
              },
            ),
          ),
        );
      },
    );
  }
}

class VenueExpansionTile extends StatelessWidget {
  final String name;
  final String label;
  final List<Events> events;

  VenueExpansionTile({this.name, this.label, this.events});

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: Text("$name"),
      subtitle: Text("Label: $label"),
      children: <Widget>[
        Card(
          child: ListView.builder(
            scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: events.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(events[index].name),
                  subtitle: Text(events[index].date.toDate().toString()),
                );
              }
          ),
        ),
      ],
    );
  }

}

class VenueSearchTile extends StatelessWidget {
  final String name;
  final String label;

  VenueSearchTile({this.name, this.label});

  @override
  Widget build(BuildContext context) {
    return ListTile();
  }

}