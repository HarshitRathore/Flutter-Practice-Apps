import "package:flutter/material.dart";
import 'package:udemy_first/app_screens/first_screen.dart';

void main() => runApp(new MyFlutterApp());

class MyFlutterApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Application With HR",
        home: Scaffold(
          appBar: AppBar(title: Text("First Udemy Application"),),
          body: FirstScreen()
        )
    );
  }

}