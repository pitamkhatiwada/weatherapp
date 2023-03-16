import 'package:flutter/material.dart';

const kTempTextStyle = TextStyle(
  fontFamily: 'Spartan MB',
  fontSize: 100,
);

const kMessageTextStyle = TextStyle(
  fontFamily: 'Spartan MB',
  fontSize: 55.0,
);

const kButtonTextStyle = TextStyle(
  fontSize: 30.0,
  fontFamily: 'Spartan MB',
);

const kConditionTextStyle = TextStyle(
  fontSize: 58,
);
const ktextfieldStyle =InputDecoration(
  filled: true,
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(12),),
    borderSide: BorderSide.none,
  ),
  fillColor: Colors.white,
  icon: Icon(Icons.location_city,
    color: Colors.white,
    size: 40,
  ),
  hintText: 'Enter City name',
  hintStyle: TextStyle(
      color: Colors.grey
  ),
);
