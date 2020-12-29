import 'package:flutter/material.dart';
import 'MyHomePage.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mobile Sign',
      theme: ThemeData(
        fontFamily: 'Gilroy',
        scaffoldBackgroundColor: Colors.white,
      ),
      home: ConnectDevice(),
      debugShowCheckedModeBanner: false,
    );
  }
}
