import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:async';


class FirebaseAccountRepository {
  final accountCollection = Firestore.instance.collection('users');

  Future<void> addAccount(String email, String userId) async {
    return await accountCollection.document(userId)
        .setData({
      'userId' : userId,
      'email' : email,
    });
  }

  Future<DocumentReference> getAccount(String userId) async{
    return accountCollection.document(userId);
  }

  //TODO: Write update account

}