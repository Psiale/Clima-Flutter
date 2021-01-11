import 'package:flutter/material.dart';

const kTempTextStyle = TextStyle(
  fontFamily: 'Spartan MB',
  fontSize: 60.0,
);

const kMessageTextStyle = TextStyle(
  fontFamily: 'Spartan MB',
  fontSize: 40.0,
);

const kButtonTextStyle = TextStyle(
  fontSize: 30.0,
  fontFamily: 'Spartan MB',
);

const kConditionTextStyle = TextStyle(
  fontSize: 80.0,
);

const kshareIconTextStyle = TextStyle(
  fontSize: 60.0,
);

const kInputTextDecoration = InputDecoration(
    hintText: 'search for a city',
    hintStyle: TextStyle(color: Colors.grey),
    fillColor: Colors.white,
    filled: true,
    border: OutlineInputBorder(
        borderSide: BorderSide.none,
        borderRadius: const BorderRadius.all(Radius.circular(10.0))),
    contentPadding: EdgeInsets.all(16.0),
    isCollapsed: true,
    icon: Icon(Icons.location_city, color: Colors.white));
