
import 'package:flutter/material.dart';

final theme = ThemeData.light().copyWith(
  appBarTheme: ThemeData.light().appBarTheme.copyWith(
    color: Colors.white,  
    elevation: 1
  ),
  primaryTextTheme: ThemeData.light().primaryTextTheme.apply(
    bodyColor: Colors.black87,
    displayColor: Colors.black87,
  )
);