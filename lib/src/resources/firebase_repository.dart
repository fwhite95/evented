import 'dart:async';
import 'package:csc413termprojectfwhite/src/models/accountModel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:csc413termprojectfwhite/src/entities/account_entity.dart';
import 'package:csc413termprojectfwhite/src/entities/venue_entity.dart';
import 'package:csc413termprojectfwhite/src/models/eventModel.dart';
import 'package:csc413termprojectfwhite/src/models/venueModel.dart';
import 'package:csc413termprojectfwhite/src/resources/firebase_provider.dart';

class FirebaseRepository {
  final accountCollection = Firestore.instance.collection('users');
  final venueCollection = Firestore.instance.collection('venues');
  final FirebaseProvider firebaseProvider = new FirebaseProvider();

  //Account + Venue functions

  //Write new methods to work with provider

  Account updateAccount(Account account){
    firebaseProvider.updateAccount(account);
    return account;
  }

  Future<List<Venue>> updateVenuesFollowed(Account account) async{
    firebaseProvider.updateAccount(account);
    List<Venue> theVenues = [];
    firebaseProvider.getVenues().listen((venues) {
    });
    return firebaseProvider.getVenues().first;

  }

  //Get venues from search
  List<dynamic> getSearchResultsFromProvider(String search){
    List<dynamic> searchResults = [];
    firebaseProvider.getVenues().listen((venues) {
      for(Venue v in venues){
        if(v.name.toLowerCase().contains(search.toLowerCase())){
          searchResults.add(v);
        }
        for(Events e in v.events){
          if(e.name.toLowerCase().contains(search.toLowerCase())){
            searchResults.add(e);
          }
        }
      }
    });

    return searchResults;
  }

  //Get events followed
  Future<List<Events>> eventsFollowedFromProvider(Account account) async{
    List<Events> eventsFollowed = [];
    //I am gonna leave it for now, but ew
    List<Venue> venues = await firebaseProvider.getVenues().first;
      for(Venue v in venues){
        for(Events e in v.events){
          for(String name in account.eventsFollowed){
            if(name == e.name){
              eventsFollowed.add(e);
            }
          }
        }
      }

    return eventsFollowed;
  }

  //VenueFollowedPage function
  //1. Takes list of venues followed from account object
  //2. Uses the list to get Venues from venue collection
  //3. Returns a list of followed venues

  List<Venue> venuesFollowedFromProvider(Account account) {
    List<Venue> venuesFollowed = [];
    firebaseProvider.getVenues().listen((venues) {
      for (Venue v in venues) {
        for (String id in account.venuesFollowed) {
          if (v.id == id) {
            venuesFollowed.add(v);
          }
        }
      }
    });
    return venuesFollowed;
  }

  Future<List<Venue>> venuesFollowedFromAccount(Account account) async {
    print('VenuesFollowed Function');
    final List<Venue> venuesFollowedList = [];
    print('1');
    print(account.toString());
    final List<String> venuesFollowedStrings = account.venuesFollowed;
    print('2');
    print(venuesFollowedStrings);
    for (String id in venuesFollowedStrings) {
      venuesFollowedList.add(await getVenuesFollowed(id));
    }
    print('3');
    return venuesFollowedList;
  }

  Future<List<Venue>> venuesFollowed(List<String> venueFollowed) async {
    print('VenuesFollowed? ');
    List<Venue> venuesFollowedList = [];
    for (String id in venueFollowed) {
      venuesFollowedList.add(await getVenuesFollowed(id));
    }
    return venuesFollowedList;
  }

  Future<Venue> getVenuesFollowed(String venueFollowed) async {
    return Venue.fromEntity(VenueEntity.fromSnapshot(
        await venueCollection.document(venueFollowed).snapshots().single));
  }

  //Account Collection Methods
  Future<void> addAccount(String email, String userId) async {
    return await accountCollection.document(userId).setData({
      'userId': userId,
      'email': email,
      'venuesFollowed': List<String>(),
      'eventsFollowed': List<String>(),
    });
  }

  Future<Account> getAccount(String userId) async {
    var snap = await accountCollection.document(userId).get();
    final Account account =
        Account.fromEntity(AccountEntity.fromSnapshot(snap));
    return account;
  }

  //Venue Collection methods
  Stream<List<Venue>> venues() {
    return venueCollection.snapshots().map((snapshot) {
      return snapshot.documents
          .map((doc) => Venue.fromEntity(VenueEntity.fromSnapshot(doc)))
          .toList();
    });
  }

}
