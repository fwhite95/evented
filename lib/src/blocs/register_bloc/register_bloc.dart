import 'package:csc413termprojectfwhite/src/blocs/login_bloc/validators.dart';
import 'package:csc413termprojectfwhite/src/blocs/register_bloc/register_event.dart';
import 'package:csc413termprojectfwhite/src/blocs/register_bloc/register_state.dart';
import 'package:csc413termprojectfwhite/src/resources/firebase_repository.dart';
import 'package:csc413termprojectfwhite/src/resources/user_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rxdart/rxdart.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final UserRepository _userRepository;
  final FirebaseRepository _accountRepository;

  RegisterBloc({@required UserRepository userRepository,
    @required FirebaseRepository accountRepository})
  :assert(userRepository != null),
  _accountRepository = accountRepository,
  _userRepository = userRepository;

  @override
  RegisterState get initialState => RegisterState.empty();

  @override
  Stream<RegisterState> transformEvents(
      Stream<RegisterEvent> events,
      Stream<RegisterState> Function(RegisterEvent event) next,
      ) {
    final nonDebounceStream = events.where((event) {
      return (event is! EmailChanged && event is! PasswordChanged);
    });
    final debounceStream = events.where((event) {
      return (event is EmailChanged || event is PasswordChanged);
    }).debounceTime(Duration(milliseconds: 300));
    return super.transformEvents(
      nonDebounceStream.mergeWith([debounceStream]),
      next,
    );
  }

  @override
  Stream<RegisterState> mapEventToState(RegisterEvent event) async* {
    if (event is EmailChanged) {
      yield* _mapEmailChangedToState(event.email);
    } else if (event is PasswordChanged) {
      yield* _mapPasswordChangedToState(event.password);
    } else if (event is Submitted) {
      yield* _mapFormSubmittedToState(
        email: event.email,
        password: event.password,
      );
    }
  }

  Stream<RegisterState> _mapEmailChangedToState(String email) async* {
    //yield state.update(isEmailValid: true);
    yield state.update(
      isEmailValid: Validators.isValidEmail(email),
    );
  }

  Stream<RegisterState> _mapPasswordChangedToState(String password) async* {
    //yield state.update(isPasswordValid: true);
    yield state.update(
      isPasswordValid: Validators.isValidPassword(password),
    );
  }

  Stream<RegisterState> _mapFormSubmittedToState({
    String email,
    String password,
  }) async* {
    yield RegisterState.loading();
    try{
      await _userRepository.signUp(
          email: email,
          password: password,
      );
      try {
        await _accountRepository.addAccount(
            email, await _userRepository.getUser());
      }catch(e){
        print("Error: $e");
        print("registerBloc");
      }
      yield RegisterState.success();

    }catch(_){

      yield RegisterState.failure();
    }
  }
}