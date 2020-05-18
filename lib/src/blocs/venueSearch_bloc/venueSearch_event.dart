import 'package:csc413termprojectfwhite/src/models/accountModel.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

abstract class SearchEvent extends Equatable {
  const SearchEvent();

  @override
  List<Object> get props => [];
}

class SearchAccountUpdate extends SearchEvent {
  final Account account;
  final String search;

  const SearchAccountUpdate({@required this.account,
    @required this.search});

  @override
  List<Object> get props => [account, search];

  @override
  String toString() {
    return 'SearchAccountUpdated: {account: $account, search: $search}';
  }
}

class SearchChanged extends SearchEvent{
  final String search;

  const SearchChanged({@required this.search});

  @override
  List<Object> get props => [search];

  @override
  String toString() {
    return 'SearchChanged: {search: $search}';
  }
}

class SearchSubmitted extends SearchEvent {
  final String search;

  const SearchSubmitted({@required this.search});

  @override
  List<Object> get props => [search];

  @override
  String toString() {
    return 'SearchSubmitted: {search: $search}';
  }
}