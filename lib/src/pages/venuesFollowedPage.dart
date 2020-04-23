import 'package:csc413termprojectfwhite/src/blocs/venuesFollowed_bloc/venuesFollowed_bloc.dart';
import 'package:csc413termprojectfwhite/src/blocs/venuesFollowed_bloc/venuesFollowed_events.dart';
import 'package:csc413termprojectfwhite/src/blocs/venuesFollowed_bloc/venuesFollowed_states.dart';
import 'package:csc413termprojectfwhite/src/resources/firebase_repository.dart';
import 'package:csc413termprojectfwhite/src/ui/appBar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class VenuesFollowedPage extends StatefulWidget{
  final String name;
  final FirebaseRepository _firebaseRepository;

  VenuesFollowedPage({Key key, this.name, @required firebaseRepository}) :
        _firebaseRepository = firebaseRepository,
        super(key: key);

  State<VenuesFollowedPage> createState() => _VenuesFollowedPageState();
}

class _VenuesFollowedPageState extends State<VenuesFollowedPage> {
  VenueFollowedBloc _venueFollowedBloc;

  FirebaseRepository get _firebaseRepository => widget._firebaseRepository;
  String get name => widget.name;

  @override
  void initState() {
    super.initState();
    _venueFollowedBloc = BlocProvider.of<VenueFollowedBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<VenueFollowedBloc, VenueFollowedState>(
    builder: (context, state){
      if(state is VenueFollowedLoading){
        return Scaffold(
          bottomNavigationBar: MainNavBar(),
          body: Center(
            child: Text(state.toString()),
          ),
        );
      }
      final venues = (state as VenueFollowedLoaded).venues;
      return Scaffold(
        bottomNavigationBar: MainNavBar(),
        body: Padding(
          padding: EdgeInsets.all(16),
          child: ListView.builder(
              itemCount: venues.length,
              itemBuilder: (context, index){
                return Card(
                  child: ListTile(
                    title: Text(venues[index].name),
                    subtitle: Text(
                        'Label: ${venues[index].label} \nAddress: ${venues[index].address}'),
                    trailing: IconButton(
                      icon: Icon(Icons.remove_circle),
                      onPressed: () {
                      },
                    ),
                  ),
                );
              }),
        )
      );
    },
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}