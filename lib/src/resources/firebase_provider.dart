import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:csc413termprojectfwhite/src/entities/account_entity.dart';
import 'package:csc413termprojectfwhite/src/entities/venue_entity.dart';
import 'package:csc413termprojectfwhite/src/models/accountModel.dart';
import 'package:csc413termprojectfwhite/src/models/venueModel.dart';

class FirebaseProvider {
  final accountCollection = Firestore.instance.collection('users');
  final venueCollection = Firestore.instance.collection('venues');

  //CRUD for users collection
  Stream<List<Account>> getAccount(){
    return accountCollection.snapshots().map((snapshot){
      return snapshot.documents
          .map((doc) => Account.fromEntity(AccountEntity.fromSnapshot(doc)))
          .toList();
    });
  }

  //Add an account to firebase
  //Return: ???? maybe return the same account again?
  Future<Account> addAccount(Account account) async{
    AccountEntity accountEntity = account.toEntity();
    await accountCollection.add(accountEntity.toDocument());
    return account;
  }

  Future<void> updateAccount(Account account) async {
    //if it doesnt return updated account
    //return new account
    return await accountCollection.document(account.userId).updateData(account.toEntity().toDocument());
  }

  Future<void> deleteAccount(Account account) async{
    await accountCollection.document(account.userId).delete();
  }


  //CRUD for venues collection
  Stream<List<Venue>> getVenues() {
    return venueCollection.snapshots().map((snapshot){
      return snapshot.documents
          .map((doc) => Venue.fromEntity(VenueEntity.fromSnapshot(doc)))
          .toList();
    });
  }

  Future<void> addVenue(Venue venue) async{
    await venueCollection.add(venue.toEntity().toDocument());
    return venue;
  }

  Future<void> updateVenue(Venue venue) async{
    return await venueCollection.document(venue.id).updateData(venue.toEntity().toDocument());
  }

  Future<void> deleteVenue(Venue venue) async{
    //have delete return updated stream?
    await venueCollection.document(venue.id).delete();
    //return getVenues();
  }
}