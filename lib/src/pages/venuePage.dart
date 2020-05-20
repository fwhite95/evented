import 'package:csc413termprojectfwhite/src/blocs/venue_bloc/venue_bloc.dart';
import 'package:csc413termprojectfwhite/src/blocs/venue_bloc/venue_events.dart';
import 'package:csc413termprojectfwhite/src/blocs/venue_bloc/venue_states.dart';
import 'package:csc413termprojectfwhite/src/models/accountModel.dart';
import 'package:csc413termprojectfwhite/src/models/venueModel.dart';
import 'package:csc413termprojectfwhite/src/resources/firebase_repository.dart';
import 'package:csc413termprojectfwhite/src/ui/appBar.dart';
import 'package:csc413termprojectfwhite/src/ui/timeFormatText.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class VenuePage extends StatelessWidget {
  final Account _account;
  final FirebaseRepository _firebaseRepository;

  VenuePage({Key key, @required account, @required firebaseRepository})
      : _firebaseRepository = firebaseRepository,
        _account = account,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<VenueBloc>(
      create: (context) {
        return VenueBloc(
          venuesRepository: _firebaseRepository,
        )..add(LoadVenue());
      },
      child: BlocBuilder<VenueBloc, VenueState>(
        builder: (context, state) {
          if (state is VenueLoading) {
            return Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
          final venues = (state as VenueLoaded).venues;
          return Scaffold(
            bottomNavigationBar: MainNavBar(
              account: _account,
              firebaseRepository: _firebaseRepository,
            ),
            appBar: AppBar(
              title: Text("Venue Search Page"),
            ),
            body: Padding(
              padding: EdgeInsets.all(16),
              child: VenueTypeTiles(
                venues: venues,
                account: _account,
              ),
            ),
          );
        },
      ),
    );
  }
}

class VenueTypeTiles extends StatelessWidget {
  final List<Venue> venues;
  final Account account;

  VenueTypeTiles({this.venues, this.account});

  @override
  Widget build(BuildContext context) {
    List<Venue> clubList = [];
    List<Venue> barList = [];
    List<Venue> concertList = [];

    //add items if more labels in future
    //or change method but good for now
    //Map maybe in future for more options
    for (Venue v in venues) {
      if (v.label == 'club') {
        clubList.add(v);
      } else if (v.label == 'bar') {
        barList.add(v);
      } else if (v.label == 'concert hall') {
        concertList.add(v);
      }
    }
    return ListView(
      children: <Widget>[
        ExpTile(
          venues: clubList,
          type: "Club",
          account: account,
        ),
        ExpTile(
          venues: concertList,
          type: "Concert Hall",
          account: account,
        ),
        ExpTile(
          venues: barList,
          type: "Bar",
          account: account,
        ),
      ],
    );
  }
}

class ExpTile extends StatelessWidget {
  final List<Venue> _venues;
  final String _type;
  final Account _account;

  ExpTile({@required venues, String type, @required account})
      : _type = type,
        _account = account,
        _venues = venues;

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: Text("$_type"),
      children: <Widget>[
        Card(
          child: ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: _venues.length,
              itemBuilder: (context, index) {
                return ExpansionTile(
                  title: Text(_venues[index].name),
                  subtitle: Text('Label: ${_venues[index].label} '
                          '\nAddress: ${_venues[index].address}'),
                  trailing: IconButton(
                    icon: Icon(Icons.add),
                    onPressed: () {
                      _account.venuesFollowed.add(_venues[index].id);
                      BlocProvider.of<VenueBloc>(context).add(
                        VenueAccountUpdated(_account),
                      );
                    },
                  ),
                  children: [
                    Card(
                      child: ListView.builder(
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          itemCount: _venues[index].events.length,
                          itemBuilder: (context, ind) {
                            return ListTile(
                              title: Text(_venues[index].events[ind].name),
                              subtitle: DateTimeFormat(
                                time: _venues[index].events[ind].date),
                              trailing: IconButton(
                                icon: Icon(Icons.add),
                                onPressed: () {
                                  _account.eventsFollowed.add(_venues[index].events[ind].name);
                                  BlocProvider.of<VenueBloc>(context).add(
                                      VenueAccountUpdated(_account)
                                  );
                                },
                              ),
                            );
                          }),
                    ),
                  ],
                );
              }),
        ),
      ],
    );
  }
}
