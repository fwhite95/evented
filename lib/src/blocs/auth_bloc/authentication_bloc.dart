import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:csc413termprojectfwhite/src/models/accountModel.dart';
import 'package:csc413termprojectfwhite/src/resources/firebase_repository.dart';
import 'package:csc413termprojectfwhite/src/resources/user_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {

  final UserRepository _userRepository;
  final FirebaseRepository _firebaseRepository;

  AuthenticationBloc({@required UserRepository userRepository, @required FirebaseRepository firebaseRepository})
  : assert(userRepository != null),
  _firebaseRepository = firebaseRepository,
  _userRepository = userRepository;

  @override
  AuthenticationState get initialState => Uninitialized();

  @override
  Stream<AuthenticationState> mapEventToState(AuthenticationEvent event,) async*{
    if(event is AppStarted){
      yield* _mapAppStartedToState();
    }else if(event is LoggedIn){
      yield* _mapLoggedInToState();
    }else if(event is LoggedOut){
      yield* _mapLoggedOutToState();
    }
  }

  Stream<AuthenticationState> _mapAppStartedToState() async*{
    try{
      final isSignedIn = await _userRepository.isSignedIn();
      if(isSignedIn){
        final name = await _userRepository.getUser();
        final Account account = await _firebaseRepository.getAccount(name);
        yield Authenticated(name, account);
      }else{
        yield Unauthenticated();
      }
    }catch(_){
      yield Unauthenticated();
    }
  }

  Stream<AuthenticationState> _mapLoggedInToState() async*{
    final name = await _userRepository.getUser();
    final Account account = await _firebaseRepository.getAccount(name);
    yield Authenticated(name, account);
  }

  Stream<AuthenticationState> _mapLoggedOutToState() async*{
    yield Unauthenticated();
    _userRepository.signOut();
  }

}