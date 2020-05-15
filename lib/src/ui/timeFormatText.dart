import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class DateTimeFormat extends StatelessWidget{
  final Timestamp _time;

  DateTimeFormat({Key key, @required time})
  : _time = time,
  super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text('Date: ${_time.toDate().month}-'
        '${_time.toDate().day}'
        '\t Time: ${_time.toDate().hour}:'
        '${_time.toDate().minute}'
        '${_time.toDate().second}');
  }
}