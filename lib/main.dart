import 'package:apitutorials/getapi_without_model.dart';
import 'package:apitutorials/home_screen.dart';
import 'package:apitutorials/last_example_of_get_api.dart';
import 'package:apitutorials/photo_api.dart';
import 'package:apitutorials/userdata.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:HomeScreen(),
    );
  }
}
