import 'package:csc413termprojectfwhite/src/models/accountModel.dart';
import 'package:equatable/equatable.dart';

abstract class AccountState extends Equatable{
  const AccountState();

  @override
  List<Object> get props => [];
}

class AccountLoading extends AccountState{}

class AccountLoaded extends AccountState {
  final Account accounts;

  const AccountLoaded(this.accounts);

  @override
  List<Object> get props => [accounts];

  @override
  String toString() {
    return 'VenueLoaded { venues: $accounts }';
  }
}

class AccountLoadFailure extends AccountState {}