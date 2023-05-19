import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fluid_bottom_nav_bar/fluid_bottom_nav_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  final usernameController = TextEditingController();

  final passwordController = TextEditingController();

  late AnimationController _animationController;
  late Animation _animation;

  @override
  void initState() {
    _animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));
    _animationController.repeat(reverse: true);
    _animation = Tween(begin: 2.0, end: 15.0).animate(_animationController)
      ..addListener(() {
        setState(() {});
      });
    super.initState();
  }

  void click(String h) {
    print(h);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => Future.value(false),
      child: Scaffold(
        backgroundColor: Color.fromARGB(255, 34, 40, 49),
        body: SafeArea(
          child: Center(
            child: Column(children: [
              const SizedBox(height: 50),
              Text(
                "SVTA EMS",
                style: TextStyle(
                    fontSize: 56,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              const SizedBox(height: 100),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () => click("tapped"),
                    onLongPress: () => click("long_press"),
                    child: Container(
                      width: 200,
                      height: 200,
                      child:
                          const Icon(Icons.sos, color: Colors.white, size: 150),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: const Color.fromARGB(255, 240, 84, 84),
                          boxShadow: [
                            BoxShadow(
                              color: const Color.fromARGB(130, 237, 125, 58),
                              blurRadius: _animation.value * 2,
                              spreadRadius: _animation.value * 2,
                            )
                          ]),
                    ),
                  ),
                ],
              ),
              //not a member? register now
            ]),
          ),
        ),
        bottomNavigationBar: FluidNavBar(
          icons: [
            FluidNavBarIcon(
                icon: Icons.home,
                backgroundColor: Colors.red,
                extras: {"label": "home"}),
            FluidNavBarIcon(
                icon: Icons.account_circle,
                backgroundColor: Colors.red,
                extras: {"label": "account"}),
            FluidNavBarIcon(
                icon: Icons.settings,
                backgroundColor: Colors.red,
                extras: {"label": "settings"}),
          ],
          style: FluidNavBarStyle(
              iconSelectedForegroundColor: Colors.white,
              iconUnselectedForegroundColor: Colors.white60,
              barBackgroundColor: Colors.black),
          scaleFactor: 1.5,
          defaultIndex: 0,
          itemBuilder: (icon, item) => Semantics(
            label: icon.extras!["label"],
            child: item,
          ),
        ),
      ),
    );
  }
}
