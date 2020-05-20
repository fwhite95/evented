import 'package:csc413termprojectfwhite/src/blocs/venueSearch_bloc/venueSearch_bloc.dart';
import 'package:csc413termprojectfwhite/src/blocs/venueSearch_bloc/venueSearch_event.dart';
import 'package:csc413termprojectfwhite/src/blocs/venueSearch_bloc/venueSearch_state.dart';
import 'package:csc413termprojectfwhite/src/models/accountModel.dart';
import 'package:csc413termprojectfwhite/src/models/eventModel.dart';
import 'package:csc413termprojectfwhite/src/models/venueModel.dart';
import 'package:csc413termprojectfwhite/src/resources/firebase_repository.dart';
import 'package:csc413termprojectfwhite/src/ui/timeFormatText.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchForm extends StatefulWidget {
  final FirebaseRepository _firebaseRepository;
  final Account _account;

  SearchForm({Key key, @required firebaseRepository, @required account})
      : assert(firebaseRepository != null),
        _firebaseRepository = firebaseRepository,
        _account = account,
        super(key: key);

  State<SearchForm> createState() => _SearchFormState();
}

class _SearchFormState extends State<SearchForm> {
  final TextEditingController _searchController = TextEditingController();

  SearchBloc _searchBloc;

  Account get _account => widget._account;
  FirebaseRepository get _firebaseRepository => widget._firebaseRepository;

  @override
  void initState() {
    super.initState();
    _searchBloc = BlocProvider.of<SearchBloc>(context);
    _searchController.addListener(_onSearchChanged);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchBloc, SearchState>(
      builder: (context, state){
        if(state is SearchLoading){
          return Center(
            child: Text(state.toString()),
          );
        }
        if(state is SearchLoadFailure){
          return Center(
            child: Text(state.toString()),
          );
        }
        if(state is SearchEmpty){
          return Padding(
            padding: EdgeInsets.all(20),
            child: Form(
              child: ListView(
                shrinkWrap: true,
                children: [
                  TextFormField(
                    controller: _searchController,
                    decoration: InputDecoration(
                      icon: Icon(Icons.search),
                      labelText: 'Search',
                    ),
                    onEditingComplete: () {
                      _onSearchChanged();
                    },
                  ),
                ],
              ),
            ),
          );
        }

        final searchResults = (state as SearchLoaded).searchResults;
        if(searchResults != null){
          return Padding(
            padding: EdgeInsets.all(20),
            child: Form(
              child: ListView(
                shrinkWrap: true,
                children: [
                  TextFormField(
                    controller: _searchController,
                    decoration: InputDecoration(
                      icon: Icon(Icons.search),
                      labelText: 'Search',
                    ),
                    onEditingComplete: () {
                      _onSearchChanged();
                    },
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: searchResults.length,
                        itemBuilder: (context, index) {
                        if(searchResults[index].runtimeType == Venue){
                          return Card(
                            child: ListTile(
                              title: Text(searchResults[index].name),
                              subtitle: Text(
                                  'Label: ${searchResults[index].label} \nAddress: ${searchResults[index].address}'),
                              trailing: IconButton(
                                icon: Icon(Icons.add),
                                onPressed: () {
                                  _account.venuesFollowed.add(searchResults[index].id);
                                  BlocProvider.of<SearchBloc>(context).add(
                                    SearchAccountUpdate(account: _account, search: _searchController.text),
                                  );
                                },
                              ),
                            ),
                          );
                        }
                        if(searchResults[index].runtimeType == Events){
                          return Card(
                            child: ListTile(
                              title: Text(searchResults[index].name),
                              subtitle: DateTimeFormat(time: searchResults[index].date),
                              trailing: IconButton(
                                icon: Icon(Icons.add),
                                onPressed: () {
                                  _account.eventsFollowed.add(searchResults[index].name);
                                  BlocProvider.of<SearchBloc>(context).add(
                                    SearchAccountUpdate(account: _account, search: _searchController.text),
                                  );
                                },
                              ),
                            ),
                          );
                        }else{
                          return Card(
                            child: ListTile(
                              title: Text('Error empty'),
                            ),
                          );
                        }
                        }),
                  ),
                ],
              ),
            ),
          );
        }else{
          return Container(
            child: Text('Search Error'),
          );
        }
      },
    );
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _onSearchChanged() {
    _searchBloc.add(
        SearchChanged(search: _searchController.text)
    );
  }


}
