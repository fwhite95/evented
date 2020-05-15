import 'package:csc413termprojectfwhite/src/blocs/auth_bloc/authentication_bloc.dart';
import 'package:csc413termprojectfwhite/src/blocs/eventsFollowed_bloc/eventsFollowed_bloc.dart';
import 'package:csc413termprojectfwhite/src/blocs/eventsFollowed_bloc/eventsFollowed_events.dart';
import 'package:csc413termprojectfwhite/src/blocs/eventsFollowed_bloc/eventsFollowed_state.dart';
import 'package:csc413termprojectfwhite/src/blocs/venue_bloc/venue_bloc.dart';
import 'package:csc413termprojectfwhite/src/blocs/venue_bloc/venue_states.dart';
import 'package:csc413termprojectfwhite/src/models/accountModel.dart';
import 'package:csc413termprojectfwhite/src/resources/firebase_repository.dart';
import 'package:csc413termprojectfwhite/src/ui/appBar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {

  final Account _account;
  final FirebaseRepository _firebaseRepository;

  HomeScreen({Key key, @required account, @required firebaseRepository}) :
        _account = account,
        _firebaseRepository = firebaseRepository,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<EventsFollowedBloc>(
      create: (context) {
        return EventsFollowedBloc(firebaseRepository: _firebaseRepository)
          ..add(GetEventsFollowed(account: _account));
      },
      child: BlocBuilder<EventsFollowedBloc, EventsFollowedState>(
        builder: (context, state) {
          if (state is EventsFollowedLoading) {
            return Scaffold(
              bottomNavigationBar: MainNavBar(),
              body: Center(
                child: Text(state.toString()),
              ),
            );
          }
          if (state is EventsFollowedLoadFailure) {
            return Scaffold(
              bottomNavigationBar: MainNavBar(),
              body: Center(
                child: Text(state.toString()),
              ),
            );
          }
          //Check if venues is empty
          //Possibly wrap with try/catch instead
          final events = (state as EventsFollowedLoaded).events;
          if(events != null){
            return Scaffold(
                bottomNavigationBar: MainNavBar(),
                body: Padding(
                  padding: EdgeInsets.all(16),
                  child: ListView.builder(
                      itemCount: events.length,
                      itemBuilder: (context, index) {
                        return Card(
                          child: ListTile(
                            title: Text(events[index].name),
                            subtitle: Text(
                                'Date: ${events[index].date}'),
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
}