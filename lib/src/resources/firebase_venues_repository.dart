import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:async';
import '../entities/venue_entity.dart';
import '../models/venueModel.dart';

class FirebaseVenuesRepository {
  final venuesCollection = Firestore.instance.collection('venues');

  Stream<List<Venue>> venues() {
    return venuesCollection.snapshots().map((snapshot){
      return snapshot.documents
          .map((doc) => Venue.fromEntity(VenueEntity.fromSnapshot(doc)))
          .toList();
    });
  }

}