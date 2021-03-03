import 'package:flutter/material.dart';

class Message extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text("ACCEPT OR REJECT", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
      ),
    );
  }
}