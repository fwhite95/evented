import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class DateTimeFormat extends StatelessWidget{
  final Timestamp _time;
  final TextStyle _textStyle;

  DateTimeFormat({Key key, @required time, TextStyle textStyle})
  : _time = time,
  _textStyle = textStyle,
  super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text('Date: ${_time.toDate().month}-'
        '${_time.toDate().day}'
        '\t Time: ${_time.toDate().hour}:'
        '${_time.toDate().minute}'
        '${_time.toDate().second}',
    style: _textStyle,);
  }
}