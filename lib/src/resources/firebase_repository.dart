import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:csc413termprojectfwhite/src/entities/account_entity.dart';
import 'package:csc413termprojectfwhite/src/entities/venue_entity.dart';
import 'package:csc413termprojectfwhite/src/models/accountModel.dart';
import 'package:csc413termprojectfwhite/src/models/venueModel.dart';

class FirebaseRepository {
  final accountCollection = Firestore.instance.collection('users');
  final venueCollection = Firestore.instance.collection('venues');

  //Account + Venue functions

  //VenueFollowedPage function
  //1. Takes list of venues followed from account object
  //2. Uses the list to get Venues from venue collection
  //3. Returns a list of followed venues

  Future<List<Venue>> venuesFollowed(List<String> venueFollowed) async{
    List<Venue> venuesFollowedList = [];
    for(String id in venueFollowed){
      venuesFollowedList.add(await getVenuesFollowed(id));
    }
    return venuesFollowedList;
  }

  Future<Venue> getVenuesFollowed(String venueFollowed) async {
    return Venue.fromEntity(VenueEntity.fromSnapshot(await venueCollection.document(venueFollowed).snapshots().single));
  }

  //Account Collection Methods
  Future<void> addAccount(String email, String userId) async {
    return await accountCollection.document(userId)
        .setData({
      'userId' : userId,
      'email' : email,
      'venueFollowed': List<String>(),
      'eventsFollowed': List<String>(),
    });
  }

  Future<Account> getAccount(String userId) async{
    return Account.fromEntity(AccountEntity.fromSnapshot(await accountCollection.document(userId).snapshots().single));
  }

  Future<void> updateAccount(Account update){
    return accountCollection.document(update.userId)
        .updateData(update.toEntity().toDocument());
  }

  //Venue Collection methods
  Stream<List<Venue>> venues() {
    return venueCollection.snapshots().map((snapshot){
      return snapshot.documents
          .map((doc) => Venue.fromEntity(VenueEntity.fromSnapshot(doc)))
          .toList();
    });
  }
}