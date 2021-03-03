import 'package:flutter/material.dart';

import 'sidebar/sidebar_layout.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.amber,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: SideBarLayout(),
    );
  }
}