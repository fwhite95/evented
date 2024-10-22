import 'package:csc413termprojectfwhite/src/models/accountModel.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

abstract class EventsFollowedEvent extends Equatable{
  const EventsFollowedEvent();

  @override
  List<Object> get props => [];
}

class GetEventsFollowed extends EventsFollowedEvent {
  final Account account;

  const GetEventsFollowed({@required this.account});

  @override
  List<Object> get props => [account];
}

class EventsFollowedAccountUpdate extends EventsFollowedEvent {
  final Account account;

  const EventsFollowedAccountUpdate({@required this.account});

  @override
  List<Object> get props => [account];
}

