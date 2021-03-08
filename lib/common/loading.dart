import 'package:flutter/material.dart';

class Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold (
      backgroundColor: Colors.brown[50],
      body: Center(
        child: Container(
          child: Icon(Icons.circle)
        )
      )
    );
  }
}