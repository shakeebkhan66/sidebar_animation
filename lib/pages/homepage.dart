import 'package:flutter/material.dart';
import '../bloc_navigation/navigation_bloc.dart';


class HomePage extends StatelessWidget with NavigationStates{
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text("HOME PAGE", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
      ),
    );
  }
}