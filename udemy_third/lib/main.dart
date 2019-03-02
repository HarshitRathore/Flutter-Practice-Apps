import "package:flutter/material.dart";
import 'package:udemy_third/app_screens/home.dart';

void main() {
  runApp(
      MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "List Views App",
        home: Scaffold(
          appBar: AppBar(
            title: Text("My Laptop List"),
          ),
          body: getListView(),
        )
      )
  );
}

Widget getListView() {
  var listView = ListView(
    children: <Widget>[
      ListTile(
        leading: Icon(Icons.laptop_chromebook),
        title: Text("My Laptop 1"),
        subtitle: Text("This was my 1st laptop."),
        trailing: Icon(Icons.apps),
        onTap: () {
          debugPrint("1st Item.");
        },
      ),
      ListTile(
        leading: Icon(Icons.laptop_windows),
        title: Text("My Laptop 2"),
        subtitle: Text("This was my 2nd laptop."),
        trailing: Icon(Icons.last_page),
        onTap: () {
          debugPrint("2nd Item.");
        },
      )
    ],
  );

  return listView;
}