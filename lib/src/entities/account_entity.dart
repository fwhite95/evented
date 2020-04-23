
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:csc413termprojectfwhite/src/models/eventModel.dart';
import 'package:equatable/equatable.dart';

class AccountEntity extends Equatable {
  final String userId;
  final String email;
  final List<String> eventsFollowed;
  final List<String> venuesFollowed;

  const AccountEntity(this.userId, this.email, this.eventsFollowed, this.venuesFollowed);

  Map<String, Object> toJson() {
    return {
      "userId": userId,
      "email": email,
      'eventsFollowed': eventsFollowed,
      'venuesFollowed': venuesFollowed,
    };
  }

  @override
  List<Object> get props => [userId, email, eventsFollowed, venuesFollowed];

  @override
  String toString() {
    return 'AccountEntity{userId: $userId, email: $email, '
        'EventsFollowed: $eventsFollowed, VenuesFollowed: $venuesFollowed';
  }

  static AccountEntity fromJson(Map<String, Object> json){

    return AccountEntity(
      json['userId'] as String,
      json['email'] as String,
      json['eventsFollowed'] as List<dynamic>,
      json['venuesFollwoed'] as List<dynamic>,
    );
  }

  static AccountEntity fromSnapshot(DocumentSnapshot snapshot){
    return AccountEntity(
      snapshot.data['userId'],
      snapshot.data['email'],
      snapshot.data['eventsFollowed'],
      snapshot.data['venuesFollwoed'],
    );
  }

  //Will be used
  //Maybe make version to only update follow lists
  Map<String, Object> toDocument() {
    return {
      "userId": userId,
      "email": email,
      'eventsFollowed': eventsFollowed,
      'venuesFollowed': venuesFollowed,
    };
  }

}