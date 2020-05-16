import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

abstract class SearchEvent extends Equatable {
  const SearchEvent();

  @override
  List<Object> get props => [];
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