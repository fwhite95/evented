import 'package:csc413termprojectfwhite/src/blocs/account_bloc/account_bloc.dart';
import 'package:csc413termprojectfwhite/src/blocs/account_bloc/account_event.dart';
import 'package:csc413termprojectfwhite/src/blocs/auth_bloc/authentication_bloc.dart';
import 'package:csc413termprojectfwhite/src/blocs/venue_bloc/venue_bloc.dart';
import 'package:csc413termprojectfwhite/src/blocs/venue_bloc/venue_events.dart';
import 'package:csc413termprojectfwhite/src/blocs/venue_bloc/venue_states.dart';
import 'package:csc413termprojectfwhite/src/models/accountModel.dart';
import 'package:csc413termprojectfwhite/src/models/venueModel.dart';
import 'package:csc413termprojectfwhite/src/resources/firebase_repository.dart';
import 'package:csc413termprojectfwhite/src/ui/appBar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class VenuePage extends StatelessWidget {
  final Account _account;
  final FirebaseRepository _firebaseRepository;


  VenuePage({Key key, @required account, @required firebaseRepository}) :
      _firebaseRepository = firebaseRepository,
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
            bottomNavigationBar: MainNavBar(account: _account,),
            appBar: AppBar(
              title: Text("Venue Search Page"),
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
              child: VenueTypeTiles(
                venues: venues,
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
  final AccountBloc accountBloc;

  VenueTypeTiles({this.venues, this.accountBloc});

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
        ExpansionTile(
          title: Text("Club"),
          children: <Widget>[
            Card(
              child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: clubList.length,
                  itemBuilder: (context, index) {
                    return Card(
                      child: ListTile(
                        title: Text(clubList[index].name),
                        subtitle: Text(
                            'Label: ${clubList[index].label} \nAddress: ${clubList[index].address}'),
                        trailing: IconButton(
                          icon: Icon(Icons.add),
                          onPressed: () {

                          },
                        ),
                      ),
                    );
                  }),
            ),
          ],
        ),
        ExpansionTile(
          title: Text("Concert Hall"),
          children: <Widget>[
            Card(
              child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: concertList.length,
                  itemBuilder: (context, index) {
                    return Card(
                      child: ListTile(
                        title: Text(concertList[index].name),
                        subtitle: Text(
                            'Label: ${concertList[index].label} \nAddress: ${clubList[index].address}'),
                        trailing: IconButton(
                          icon: Icon(Icons.add),
                        ),
                      ),
                    );
                  }),
            ),
          ],
        ),
        ExpansionTile(
          title: Text("Bar"),
          children: <Widget>[
            Card(
              child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: barList.length,
                  itemBuilder: (context, index) {
                    return Card(
                      child: ListTile(
                        title: Text(barList[index].name),
                        subtitle: Text(
                            'Label: ${barList[index].label} '
                                '\nAddress: ${barList[index].address}'),
                        trailing: IconButton(
                          icon: Icon(Icons.add),
                        ),
                      ),
                    );
                  }),
            ),
          ],
        ),
      ],
    );
  }

  void _onUpdateSubmitted(Account account) {
    accountBloc.add(AccountUpdated(account));
  }
}
