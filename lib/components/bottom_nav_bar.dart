import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:pharmap/screens/home/explore_screen.dart';
import 'package:pharmap/screens/home/home_screen.dart';
import 'package:pharmap/screens/home/notification_screen.dart';
import 'package:pharmap/screens/home/profile_screen.dart';
import 'package:pharmap/utils/constants.dart';

class BottomNavBar extends StatefulWidget {
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  PersistentTabController _controller =
      PersistentTabController(initialIndex: 0);

  List<Widget> _buildScreens() {
    return [
      HomeScreen(),
      ExploreScreen(),
      NotificationScreen(),
      ProfileScreen(),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: Icon(Icons.home),
        title: ("Home"),
        activeColorPrimary: primaryColor,
        inactiveColorPrimary: darkPrimaryColor,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.search),
        title: ("Explore"),
        activeColorPrimary: primaryColor,
        inactiveColorPrimary: darkPrimaryColor,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.notification_add),
        title: ("News"),
        activeColorPrimary: primaryColor,
        inactiveColorPrimary: darkPrimaryColor,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.settings),
        title: ("Profile"),
        activeColorPrimary: primaryColor,
        inactiveColorPrimary: darkPrimaryColor,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      controller: _controller,
      screens: _buildScreens(),
      items: _navBarsItems(),
      confineInSafeArea: true,
      backgroundColor: Colors.white, // Default is Colors.white.
      handleAndroidBackButtonPress: true, // Default is true.
      resizeToAvoidBottomInset:
          true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
      stateManagement: true, // Default is true.
      hideNavigationBarWhenKeyboardShows:
          true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
      decoration: NavBarDecoration(
        borderRadius: BorderRadius.circular(10.0),
        colorBehindNavBar: Colors.white,
      ),
      popAllScreensOnTapOfSelectedTab: true,
      popActionScreens: PopActionScreensType.all,
      itemAnimationProperties: ItemAnimationProperties(
        // Navigation Bar's items animation properties.
        duration: Duration(milliseconds: 200),
        curve: Curves.ease,
      ),
      screenTransitionAnimation: ScreenTransitionAnimation(
        // Screen transition animation on change of selected tab.
        animateTabTransition: true,
        curve: Curves.ease,
        duration: Duration(milliseconds: 200),
      ),
      navBarStyle:
          NavBarStyle.style6, // Choose the nav bar style with this property.
    );
  }
}
