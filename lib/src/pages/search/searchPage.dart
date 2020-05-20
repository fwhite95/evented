import 'package:csc413termprojectfwhite/src/blocs/venueSearch_bloc/venueSearch_bloc.dart';
import 'package:csc413termprojectfwhite/src/models/accountModel.dart';
import 'package:csc413termprojectfwhite/src/pages/search/searchForm.dart';
import 'package:csc413termprojectfwhite/src/resources/firebase_repository.dart';
import 'package:csc413termprojectfwhite/src/ui/appBar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchPage extends StatelessWidget {
  final FirebaseRepository _firebaseRepository;
  final Account _account;

  SearchPage({Key key, @required firebaseRepository, @required account})
      : assert(firebaseRepository != null),
        _account = account,
        _firebaseRepository = firebaseRepository,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search'),
      ),
      bottomNavigationBar: MainNavBar(account: _account, firebaseRepository: _firebaseRepository,),
      body: BlocProvider<SearchBloc>(
        create: (context) =>
            SearchBloc(firebaseRepository: _firebaseRepository),
        child: SearchForm(firebaseRepository: _firebaseRepository, account: _account),
      ),
    );
  }
}
