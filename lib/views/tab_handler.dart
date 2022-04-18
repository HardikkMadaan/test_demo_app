import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:provider/provider.dart';
import 'package:test_demo_app/provider/app_provider.dart';

class TabHandler extends StatelessWidget {
  const TabHandler({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GNav(
      rippleColor: Colors.grey.shade800,
      // tab button ripple color when pressed
      hoverColor: Colors.grey.shade700,
      // tab button hover color
      haptic: true,
      // haptic feedback
      tabBorderRadius: 15,
      tabActiveBorder: Border.all(color: Colors.white),
      // tab button border
      tabBorder: Border.all(color: Colors.white),
      // tab button border
      tabShadow: [
        BoxShadow(color: Colors.grey.withOpacity(0.5), blurRadius: 8)
      ],
      // tab button shadow
      curve: Curves.fastOutSlowIn,
      // tab animation curves
      duration: const Duration(milliseconds: 900),
      // tab animation duration
      gap: 8,
      // the tab button gap between icon and text
      color: Colors.grey[800],
      // unselected icon color
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      activeColor: Colors.teal,
      // selected icon and text color
      iconSize: 24,
      // tab button icon size
      tabBackgroundColor: Colors.teal.withOpacity(0.2),
      // selected tab background color
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      // navigation bar padding
      onTabChange: context.read<AppProvider>().onTabChange,
      tabs: const [
        GButton(
          icon: Icons.perm_identity,
          text: 'Employee',
        ),
        GButton(
          icon: Icons.featured_video,
          text: 'Profile',
        ),
      ],
    );
  }
}
