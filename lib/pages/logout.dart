import 'package:flutter/material.dart';

class Logout extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text("LOGOUT", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
      ),
    );
  }
}