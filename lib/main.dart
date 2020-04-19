import 'package:flutter/material.dart';
import 'views/home_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    //TODO: add theme related stuff here
    return new MaterialApp(
      title: 'Voting App',
      theme: ThemeData(fontFamily: 'Poppins'),
      home: HomePage(),
    );
  }
}