import 'package:flutter/material.dart';
import 'package:untitled1/app_theme.dart';
import 'package:untitled1/fitness_app/fitness_app_home_screen.dart';
import 'custom_drawer/home_drawer.dart';
import 'custom_drawer/drawer_user_controller.dart';


class NavigationScreen extends StatefulWidget {
  @override
  State<NavigationScreen> createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  DrawerIndex? drawerIndex;
  Widget? screenView;


  @override
  void initState() {
    drawerIndex = DrawerIndex.HOME;
    screenView = FitnessAppHomeScreen();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppTheme.white,
      child:SafeArea(
        top: false,
        bottom: false,
        child: Scaffold(
          backgroundColor: AppTheme.nearlyWhite,
          body: DrawerUserController(
            screenIndex: drawerIndex,
            drawerWidth: MediaQuery.of(context).size.width * 0.75,
            onDrawerCall: (DrawerIndex drawerIndexdata){
              changeIndex(drawerIndexdata);
            },
            screenView: FitnessAppHomeScreen(),
          ),
        ),
      ),
    );
  }
  void changeIndex(DrawerIndex drawerIndexdata) {
    if (drawerIndex != drawerIndexdata) {
      drawerIndex = drawerIndexdata;
      switch (drawerIndex) {
        case DrawerIndex.HOME:
          setState(() {
            // screenView = const MyHomePage();
          });
          break;
        case DrawerIndex.Help:
          setState(() {
            // screenView = HelpScreen();
          });
          break;
        case DrawerIndex.FeedBack:
          setState(() {
            // screenView = FeedbackScreen();
          });
          break;
        case DrawerIndex.Invite:
          setState(() {
            // screenView = InviteFriend();
          });
          break;
        default:
          break;
      }
    }
  }

}
