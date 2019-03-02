import 'dart:math';

import 'package:flutter/material.dart';

class FirstScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new Material(
      color: Colors.deepPurple,
      child: Center(
        child: Text(
          ,
          textDirection: TextDirection.ltr,
          style: TextStyle(color: Colors.white, fontSize: 40.0),
        ),
      ),
    );
  }

  String generateLuckyNumber() {
    var random = Random();
    int luckynumber = random.nextInt(100);
    return "Your lucky number is ${generateLuckyNumber()}";
  }

}