import 'package:csc413termprojectfwhite/src/blocs/venue_bloc/venue_bloc.dart';
import 'package:csc413termprojectfwhite/src/blocs/venue_bloc/venue_states.dart';
import 'package:csc413termprojectfwhite/src/models/eventModel.dart';
import 'package:csc413termprojectfwhite/src/models/venueModel.dart';
import 'package:csc413termprojectfwhite/src/pages/search/searchForm.dart';
import 'package:csc413termprojectfwhite/src/ui/appBar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchPage extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();
  final List<Venue> venuesSearched = [];
  final List<Events> eventsSearched = [];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<VenueBloc, VenueState>(
      builder: (context, state){
        if(state is VenueLoading){
          return Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
        //doesnt load states, only loads the venues from the venueLoaded method
        //State is not correct
        final venues = (state as VenueLoaded).venues;
        for(Venue v in venues){
          if(v.name.contains(_controller.text)){
            venuesSearched.add(v);
          }
          for(Events e in v.events){
            if(e.name.contains(_controller.text)){
              eventsSearched.add(e);
            }
          }
        }
        return Scaffold(
          bottomNavigationBar: MainNavBar(),
          appBar: AppBar(
            title: Text('Search Page'),
          ),
          body: Padding(
            padding: EdgeInsets.all(16),
            child: ListView(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 20),
                ),
                TextFormField(
                  controller: _controller,
                  keyboardType: TextInputType.text,
                  autocorrect: false,
                ),
                Container(
                  child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                    itemCount: venuesSearched.length,
                      itemBuilder: (context, index){
                      return Card(
                        child: ListTile(
                          title: Text(venuesSearched[index].name),
                        ),
                      );
                      }),
                ),
                Container(
                  child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemCount: eventsSearched.length,
                      itemBuilder: (context, index){
                        return Card(
                          child: ListTile(
                            title: Text(eventsSearched[index].name),
                          ),
                        );
                      }),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

