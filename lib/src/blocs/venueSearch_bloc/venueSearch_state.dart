
import 'package:equatable/equatable.dart';

abstract class SearchState extends Equatable{
  const SearchState();

  @override
  List<Object> get props => [];
}

class SearchEmpty extends SearchState {}

class SearchLoading extends SearchState{}

class SearchLoaded extends SearchState {
  final List<dynamic> searchResults;

  const SearchLoaded([this.searchResults = const [],]);

  @override
  List<Object> get props => [searchResults];

  @override
  String toString() {
    return 'SearchLoaded { searchResults: $searchResults }';
  }
}

class SearchLoadFailure extends SearchState {}