
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:csc413termprojectfwhite/src/models/eventModel.dart';
import 'package:equatable/equatable.dart';

class AccountEntity extends Equatable {
  final String userId;
  final String email;
  //final List<String> eventsFollowed;
  //final List<String> venuesFollowed

  const AccountEntity(this.userId, this.email);

  Map<String, Object> toJson() {
    return {
      "userId": userId,
      "email": email,
    };
  }

  @override
  List<Object> get props => [userId, email];

  @override
  String toString() {
    return 'AccountEntity{userId: $userId, email: $email, ';
  }

  static AccountEntity fromJson(Map<String, Object> json){

    return AccountEntity(
      json['userId'] as String,
      json['email'] as String,
    );
  }

  static AccountEntity fromSnapshot(DocumentSnapshot snapshot){
    return AccountEntity(
      snapshot.data['userId'],
      snapshot.data['email'],
    );
  }

  //Will be used
  //Maybe make version to only update follow lists
  Map<String, Object> toDocument() {
    return {
      "userId": userId,
      "email": email,
    };
  }

}