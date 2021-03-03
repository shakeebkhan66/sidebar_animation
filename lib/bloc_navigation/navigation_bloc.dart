import 'package:bloc/bloc.dart';
import '../pages/homepage.dart';


enum NavigationEvents {
  HomePageClickedEvent,
  MyAccountClickedEvent,
  checkRequestClickedEvent,
  studentRegisteredClickedEvent,
  projectLiseClickedEvent,
  MessageClickedEvent,
  LogoutClickedEvent
}

abstract class NavigationStates {}

class NavigationBloc extends Bloc<NavigationEvents, NavigationStates> {
  NavigationBloc(NavigationStates initialState) : super(initialState);

  NavigationStates get initialState => HomePage();

@override
  Stream<NavigationStates> mapEventToState(NavigationEvents event) async*{
  switch (event) {
    case NavigationEvents.HomePageClickedEvent: yield HomePage();
    break;
    case NavigationEvents.MyAccountClickedEvent: yield HomePage();
    break;
    case NavigationEvents.checkRequestClickedEvent: yield HomePage();
    break;
    case NavigationEvents.projectLiseClickedEvent: yield HomePage();
    break;
    case NavigationEvents.studentRegisteredClickedEvent: yield HomePage();
    break;
    case NavigationEvents.projectLiseClickedEvent: yield HomePage();
    break;
    case NavigationEvents.LogoutClickedEvent: yield HomePage();
    break;
  }
}

}