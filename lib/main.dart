import 'package:flutter/material.dart';
import 'package:speech_tes/pages/home_page.dart';
import 'package:speech_tes/routes/routes.dart';
import 'package:speech_tes/theme/theme.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Speech App',
      debugShowCheckedModeBanner: false,
      initialRoute: HomePage.routeName,
      routes: routes,
      theme: theme,
    );
  }
}