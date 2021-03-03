import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import '../bloc_navigation/navigation_bloc.dart';
import '../sidebar/menu_item.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SideBar extends StatefulWidget {
  @override
  _SideBarState createState() => _SideBarState();
}
class _SideBarState extends State<SideBar> with SingleTickerProviderStateMixin<SideBar>{

   AnimationController _animationController;
   StreamController<bool> isSidebarOpenedStreamController;
   Stream<bool> isSideBarOpenedStream;
   StreamSink<bool> isSidebarOpenedSink;

  final _animationDuration = const Duration(milliseconds: 500);

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(vsync: this, duration: _animationDuration);
    isSidebarOpenedStreamController = PublishSubject<bool>();
    isSideBarOpenedStream = isSidebarOpenedStreamController.stream;
    isSidebarOpenedSink = isSidebarOpenedStreamController.sink;

  }

  @override
  void dispose(){
    _animationController.dispose();
    isSidebarOpenedStreamController.close();
    isSidebarOpenedSink.close();
    super.dispose();
  }

  void onIconPressed(){
  final animationStatus = _animationController.status;
  final isAnimationCompleted = animationStatus == AnimationStatus.completed;

  if(isAnimationCompleted){
    isSidebarOpenedSink.add(false);
   _animationController.reverse();
  }else{
    isSidebarOpenedSink.add(true);
    _animationController.forward();
  }
  }

  @override
  Widget build(BuildContext context) {

    final screenWidth = MediaQuery.of(context).size.width;
    return StreamBuilder(
      initialData: false,
      stream: isSideBarOpenedStream,
      builder: (context, isSideBarOpenedAsync){
        return AnimatedPositioned(
          duration: _animationDuration,
          top: 0,
          bottom: 0,
          left: isSideBarOpenedAsync.data ? 0 : - screenWidth,
          right: isSideBarOpenedAsync.data ? 0 : screenWidth - 45,
          child: Row(
            children: <Widget>[
              Expanded(
                child: Container(
                  color: Colors.amber,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Column(
                      children: <Widget>[
                        SizedBox(height: 100,),
                        ListTile(
                          title: Text("FARHAD MUBASHIR", style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                          ),
                          ),
                          subtitle: Text(
                            "far@gmail.com",
                            style: TextStyle(
                              color: Colors.black.withOpacity(0.5),
                              fontSize: 20,

                            ),
                          ),
                          leading: CircleAvatar(
                            backgroundColor: Colors.white54,
                            child: Icon(
                              Icons.perm_identity,
                              color: Colors.black,
                            ),
                            radius: 40,
                          ),
                        ),
                        Divider(
                          height: 64,
                          thickness: 0.5,
                          color: Colors.white.withOpacity(0.5),
                          indent: 14,
                          endIndent: 14,
                        ),
                        MenuItem(
                          icon: Icons.home_sharp,
                          title: "Home",
                          onTap: (){
                            onIconPressed();
                            BlocProvider.of<NavigationBloc>(context).add(NavigationEvents.HomePageClickedEvent);
                          },
                        ),
                        MenuItem(
                          icon: Icons.account_circle,
                          title: "My Account",
                          onTap: (){
                            onIconPressed();
                            BlocProvider.of<NavigationBloc>(context).add(NavigationEvents.MyAccountClickedEvent);
                          },
                        ),
                        MenuItem(
                          icon: Icons.request_quote_rounded,
                          title: "Check Requests",
                          onTap: (){
                            onIconPressed();
                            BlocProvider.of<NavigationBloc>(context).add(NavigationEvents.checkRequestClickedEvent);
                          },
                        ),
                        MenuItem(
                          icon: Icons.person,
                          title: "Registered Students",
                          onTap: (){
                            onIconPressed();
                            BlocProvider.of<NavigationBloc>(context).add(NavigationEvents.studentRegisteredClickedEvent);
                          },
                        ),
                        MenuItem(
                          icon: Icons.list_rounded,
                          title: "Project List",
                          onTap: (){
                            onIconPressed();
                            BlocProvider.of<NavigationBloc>(context).add(NavigationEvents.projectLiseClickedEvent);
                          },
                        ),
                        MenuItem(
                          icon: Icons.message,
                          title: "Message",
                          onTap: (){
                            onIconPressed();
                            BlocProvider.of<NavigationBloc>(context).add(NavigationEvents.MessageClickedEvent);
                          },
                        ),
                        Divider(
                          height: 64,
                          thickness: 1,
                          color: Colors.white.withOpacity(0.5),
                          indent: 14,
                          endIndent: 14,
                        ),
                        MenuItem(
                          icon: Icons.logout,
                          title: "Logout",
                          onTap: (){
                            onIconPressed();
                            BlocProvider.of<NavigationBloc>(context).add(NavigationEvents.LogoutClickedEvent);
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment(0, -0.8),
                child: GestureDetector(
                  onTap: (){
                    onIconPressed();
                  },
                  child: ClipPath(
                    clipper: CustomMenuClipper(),
                    child: Container(
                      width: 35,
                      height: 110,
                      color: Colors.amber,
                      alignment: Alignment.centerLeft,
                      child: AnimatedIcon(
                        progress: _animationController.view,
                        icon: AnimatedIcons.menu_close,
                        color: Colors.white,
                        size: 25,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}

class CustomMenuClipper extends CustomClipper<Path>{
  @override
  Path getClip(Size size) {
    Paint paint = Paint();
    paint.color = Colors.white;

    final width = size.width;
    final height = size.height;

    Path path = Path();
    path.moveTo(0, 0);
    path.quadraticBezierTo(0, 8, 10, 16);
    path.quadraticBezierTo(width-1, height/2 - 20, width, height/2);
    path.quadraticBezierTo(width+1, height/2 + 20, 10, height-16);
    path.quadraticBezierTo(0, height - 8, 0, height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
  
}