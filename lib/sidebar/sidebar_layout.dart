import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc_navigation/navigation_bloc.dart';
import '../pages/homepage.dart';
import 'sidebar.dart';

class SideBarLayout extends StatelessWidget{
  NavigationStates get initialState => HomePage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  BlocProvider <NavigationBloc>(
        create: (context) => NavigationBloc(initialState),
        child: Stack(
          children: <Widget>[
            BlocBuilder<NavigationBloc, NavigationStates>(
              builder: (context, navigationState){
                return navigationState as Widget;
              },
            ),
            SideBar(),
          ],
        ),
      ),
    );
  }
}