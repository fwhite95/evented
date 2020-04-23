import 'package:equatable/equatable.dart';
import 'package:csc413termprojectfwhite/src/models/accountModel.dart';
import 'package:csc413termprojectfwhite/src/models/venueModel.dart';
import 'package:csc413termprojectfwhite/src/models/eventModel.dart';

abstract class AccountEvent extends Equatable{
  const AccountEvent();

  @override
  List<Object> get props => [];
}

class LoadAccount extends AccountEvent {
  final String userId;

  const LoadAccount(this.userId);

  @override
  List<Object> get props => [userId];

  @override
  String toString() {
    return 'LoadAccount {account: $userId }';
  }
}

class AccountLoadVenuesFollowed extends AccountEvent {}

class AccountLoadEventsFollowed extends AccountEvent {}


class AccountAdded extends AccountEvent {
  final String userId;
  final String email;

  const AccountAdded(this.userId, this.email);

  @override
  List<Object> get props => [userId, this.email];

  @override
  String toString() {
    return 'AccountAdded {userId: $userId, email: $email }';
  }
}

//used in settings to update account object
class AccountUpdated extends AccountEvent {
  final Account account;

  const AccountUpdated(this.account);

  @override
  List<Object> get props => [account];

  @override
  String toString() {
    return 'AccountUpdated {account: $account }';
  }
}

class AccountDeleted extends AccountEvent {
  final Account account;

  const AccountDeleted(this.account);

  @override
  List<Object> get props => [account];

  @override
  String toString() {
    return 'AccountDeleted {account: $account }';
  }
}


