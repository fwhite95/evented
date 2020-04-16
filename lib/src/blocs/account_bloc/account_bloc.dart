import 'dart:async';
import 'package:csc413termprojectfwhite/src/resources/user_repository.dart';
import 'package:flutter/material.dart';
import 'package:csc413termprojectfwhite/src/blocs/account_bloc/account_event.dart';
import 'package:csc413termprojectfwhite/src/blocs/account_bloc/account_state.dart';
import 'package:csc413termprojectfwhite/src/resources/firebase_account_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AccountBloc extends Bloc<AccountEvent, AccountState> {
  final FirebaseAccountRepository _accountRepository;
  //StreamSubscription _accountSubscription;

  AccountBloc({@required FirebaseAccountRepository accountRepository,})
      : assert (accountRepository != null),
        _accountRepository = accountRepository;

  @override
  AccountState get initialState => AccountLoading();

  @override
  Stream<AccountState> mapEventToState(AccountEvent event) async*{
    if(event is LoadAccount){
      //yield* _mapLoadAccountToState(event);
    } else if(event is AccountUpdated) {
      //yield* _mapAccountUpdateToState(event);
    }else if(event is AccountLoadVenuesFollowed) {
      //yield* _mapAccountLoadVenuesToState(event);
    }
    else if(event is AccountLoadEventsFollowed) {
      //yield* _mapAccountLoadEventsToState(event);
    } else if (event is AccountAdded){
      yield* _mapAccountAddedToState(event);
    }
  }

  Stream<AccountState> _mapLoadAccountToState(LoadAccount event) async* {
    //TODO: needs to load account from DB given userId
    //yield AccountLoaded(event.userId);
  }

  Stream<AccountState> _mapAccountUpdateToState(AccountUpdated event) async* {
    yield AccountLoaded(event.account);
  }

  Stream<AccountState> _mapAccountAddedToState(AccountAdded event) async* {
    _accountRepository.addAccount(event.userId, event.email);
  }

//  Stream<AccountState> _mapAccountLoadVenuesToState(AccountLoadVenuesFollowed event) async* {
//    yield AccountLoaded(event); // yield AccountVenuesFollowedLoaded(event.venues);
//  }
//
//  Stream<AccountState> _mapAccountLoadEventsToState(AccountLoadEventsFollowed event) async* {
//    yield AccountLoaded(event.venues); // yield AccountEventsFollowedLoaded(event.events);
//  }

  //maybe dont need
//  @override
//  Future<void> close() {
//    _venuesSubscription?.cancel();
//    return super.close();
//  }

}