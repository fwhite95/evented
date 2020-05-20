import 'package:csc413termprojectfwhite/src/models/venueModel.dart';
import 'package:flutter/material.dart';

class VenueDetailPage extends StatelessWidget{
  final Venue _venue;

  VenueDetailPage({Key key, @required venue})
  : _venue = venue,
  super(key: key);

  @override
  Widget build(BuildContext context) {
   return Scaffold(
     appBar: AppBar(title: Text("${_venue.name}",)),
     body: Padding(
       padding: EdgeInsets.all(16),
       child: ListView(
         children: [
           Text('${_venue.name}',
           textAlign: TextAlign.center,
             style: TextStyle(
                 fontWeight: FontWeight.bold,
               fontSize: 30,
             ),
           ),
           Text('Label: ${_venue.label}',
           textAlign: TextAlign.center,
           style: TextStyle(
             fontStyle: FontStyle.italic,
           ),),
           SizedBox(height: 20,),
           Text('Address: ${_venue.address}',
           style: TextStyle(
             fontSize: 20,
           ),),
           SizedBox(height: 10,),
         ],
       ),
     ),
   );
  }

}