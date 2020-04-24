import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:csc413termprojectfwhite/src/models/accountModel.dart';
import 'dart:async';

class FirebaseAccountRepository {
  final accountCollection = Firestore.instance.collection('users');

  Future<void> addAccount(String email, String userId) async {
    return await accountCollection.document(userId)
        .setData({
      'userId' : userId,
      'email' : email,
      'venuesFollowed': List<String>(),
      'eventsFollowed': List<String>(),
    });
  }

  Future<DocumentReference> getAccount(String userId) async{
    return accountCollection.document(userId);
  }

  Future<void> updateAccount(Account update){
    return accountCollection.document(update.userId)
        .updateData(update.toEntity().toDocument());
  }

}