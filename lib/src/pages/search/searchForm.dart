import 'package:csc413termprojectfwhite/src/models/venueModel.dart';
import 'package:flutter/material.dart';

class SearchForm extends StatefulWidget{


  SearchForm({Key key})
  : super(key: key);

  State<SearchForm> createState() => _SearchFormState();
}

class _SearchFormState extends State<SearchForm>{
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _searchController.addListener(_onSearchChanged);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _onSearchChanged(){

  }

  //void _onVenueFollowed() {}
//void _onEventFollowed() {}

}