import 'package:csc413termprojectfwhite/src/models/eventModel.dart';
import 'package:csc413termprojectfwhite/src/ui/timeFormatText.dart';
import 'package:flutter/material.dart';

class EventDetailPage extends StatelessWidget{
  final Events _events;

  EventDetailPage({Key key, @required event})
      : _events = event,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("${_events.name}",)),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: ListView(
          children: [
            Text('${_events .name}',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ),
            ),

            SizedBox(height: 20,),
            DateTimeFormat(time: _events.date, textStyle: TextStyle(
              fontSize: 20,
            ),),
            SizedBox(height: 10,),
          ],
        ),
      ),
    );
  }

}