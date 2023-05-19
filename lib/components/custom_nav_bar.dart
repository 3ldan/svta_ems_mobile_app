import 'package:fluid_bottom_nav_bar/fluid_bottom_nav_bar.dart';
import 'package:flutter/material.dart';
import '../pages/home_page.dart';

class CustomNavBar extends StatefulWidget {
  const CustomNavBar({super.key});

  @override
  State<CustomNavBar> createState() => _CustomNavBarState();
}

class _CustomNavBarState extends State<CustomNavBar> {
  Widget? _child;

  void _handleNavigationChange(int index) {
    setState(() {
      switch (index) {
        case 0:
          _child = HomePage();
          break;
        case 1:
          _child = HomePage();
          break;
        case 2:
          _child = HomePage();
          break;
      }
      _child = AnimatedSwitcher(
        switchInCurve: Curves.easeOut,
        switchOutCurve: Curves.easeIn,
        duration: Duration(milliseconds: 500),
        child: _child,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return FluidNavBar(
      icons: [
        FluidNavBarIcon(
            icon: Icons.home,
            backgroundColor: Colors.pink,
            extras: {"label": "home"}),
        FluidNavBarIcon(
            icon: Icons.account_circle,
            backgroundColor: Colors.pink,
            extras: {"label": "account"}),
        FluidNavBarIcon(
            icon: Icons.settings,
            backgroundColor: Colors.pink,
            extras: {"label": "settings"}),
      ],
      onChange: _handleNavigationChange,
      style: FluidNavBarStyle(
          iconSelectedForegroundColor: Colors.white,
          iconUnselectedForegroundColor: Colors.white60),
      scaleFactor: 1.5,
      defaultIndex: 0,
      itemBuilder: (icon, item) => Semantics(
        label: icon.extras!["label"],
        child: item,
      ),
    );
  }
}
