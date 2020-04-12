import 'package:csc413termprojectfwhite/src/blocs/venue_bloc/venue_bloc.dart';
import 'package:csc413termprojectfwhite/src/blocs/venue_bloc/venue_states.dart';
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
        final venues = (state as VenueLoaded).venues;
        return Scaffold(
          appBar: AppBar(
            title: Text("Venue Search Page"),
          ),
          body: Padding(
            padding: EdgeInsets.all(16),
            child: ListView.builder(
              itemCount: venues.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text('${venues[index].address}'),
                );
              },
            ),
          ),
        );
      },
    );
  }
}