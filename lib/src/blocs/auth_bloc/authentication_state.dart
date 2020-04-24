part of 'authentication_bloc.dart';


abstract class AuthenticationState extends Equatable{
  const AuthenticationState();

  @override
  List<Object> get props => [];
}

class Uninitialized extends AuthenticationState{}

class Authenticated extends AuthenticationState{
  final String displayName;
  final Account account;

  const Authenticated(this.displayName, this.account);

  @override
  List<Object> get props => [displayName, account];
  @override
  String toString() => 'Authenticated { displayName: $displayName, account: $account }';

}

class Unauthenticated extends AuthenticationState {}