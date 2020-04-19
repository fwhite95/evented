import 'package:csc413termprojectfwhite/src/blocs/venue_bloc/venue_bloc.dart';
import 'package:csc413termprojectfwhite/src/blocs/venue_bloc/venue_states.dart';
import 'package:csc413termprojectfwhite/src/pages/search/searchForm.dart';
import 'package:csc413termprojectfwhite/src/ui/appBar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchPage extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();

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
        final venues = (state as VenueLoaded).venues;
        return Scaffold(
          bottomNavigationBar: MainNavBar(),
          appBar: AppBar(
            title: Text('Search Page'),
          ),
          body: Padding(
            padding: EdgeInsets.all(16),
            child: SearchForm(),
          ),
        );
      },
    );
  }
}

