import 'package:csc413termprojectfwhite/src/blocs/venuesFollowed_bloc/venuesFollowed_bloc.dart';
import 'package:csc413termprojectfwhite/src/blocs/venuesFollowed_bloc/venuesFollowed_events.dart';
import 'package:csc413termprojectfwhite/src/blocs/venuesFollowed_bloc/venuesFollowed_states.dart';
import 'package:csc413termprojectfwhite/src/models/accountModel.dart';
import 'package:csc413termprojectfwhite/src/resources/firebase_repository.dart';
import 'package:csc413termprojectfwhite/src/ui/appBar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class VenuesFollowedPage extends StatefulWidget {
  final String name;
  final FirebaseRepository _firebaseRepository;
  final Account _account;

  VenuesFollowedPage(
      {Key key, this.name, @required firebaseRepository, @required account})
      : _firebaseRepository = firebaseRepository,
        _account = account,
        super(key: key);

  State<VenuesFollowedPage> createState() => _VenuesFollowedPageState();
}

class _VenuesFollowedPageState extends State<VenuesFollowedPage> {
  FirebaseRepository get _firebaseRepository => widget._firebaseRepository;
  String get name => widget.name;
  Account get _account => widget._account;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<VenueFollowedBloc>(
      create: (context) {
        return VenueFollowedBloc(venuesRepository: _firebaseRepository)
          ..add(VenuesFollowedLoadEvent(account: _account));
      },
      child: BlocBuilder<VenueFollowedBloc, VenueFollowedState>(
        builder: (context, state) {
          if (state is VenueFollowedLoading) {
            return Scaffold(
              bottomNavigationBar: MainNavBar(),
              body: Center(
                child: Text(state.toString()),
              ),
            );
          }
          if (state is VenueFollowedLoadFailure) {
            return Scaffold(
              bottomNavigationBar: MainNavBar(),
              body: Center(
                child: Text(state.toString()),
              ),
            );
          }
          //Check if venues is empty
          //Possibly wrap with try/catch instead
          final venues = (state as VenueFollowedLoaded).venues;
          if(venues != null){
            return Scaffold(
                bottomNavigationBar: MainNavBar(),
                body: Padding(
                  padding: EdgeInsets.all(16),
                  child: ListView.builder(
                      itemCount: venues.length,
                      itemBuilder: (context, index) {
                        return Card(
                          child: ListTile(
                            title: Text(venues[index].name),
                            subtitle: Text(
                                'Label: ${venues[index].label} \nAddress: ${venues[index].address}'),
                            trailing: IconButton(
                              icon: Icon(Icons.remove_circle),
                              onPressed: () {},
                            ),
                          ),
                        );
                      }),
                ));
          }else {
            return Container(
              child: Text('Error: Venue empty'),
            );
          }

        },
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
