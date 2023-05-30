library flutter_advanced_drawer;

import 'package:flutter/material.dart';
import 'package:fluid_bottom_nav_bar/fluid_bottom_nav_bar.dart';

import 'login_page.dart';

import 'screens/profile.dart';
import 'screens/home.dart';
import 'screens/forms.dart';

part '../components/drawer/controller.dart';
part '../components/drawer/value.dart';
part '../components/drawer/widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  Widget? _child;

  final _advancedDrawerController = AdvancedDrawerController();
  int currentIndex = 0;

  void click(String h) {
    print(h);
  }

  void _handleNavigationChange(int index) {
    setState(() {
      switch (index) {
        case 0:
          _child = HomeContent();
          currentIndex = 0;
          break;
        case 1:
          _child = FormsContent();
          currentIndex = 1;
          break;
        case 2:
          _child = ProfileContent();
          currentIndex = 2;
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

  void userLogout() async {
    var navigationResult = await Navigator.push(
        context, new MaterialPageRoute(builder: (context) => LoginPage()));

    if (navigationResult == true) {
      showDialog(
          context: context,
          builder: (context) => AlertDialog(
                title: Text("Hello World"),
              ));
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    _handleNavigationChange(0);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AdvancedDrawer(
      backdropColor: Color(0xFF30475E),
      controller: _advancedDrawerController,
      animationCurve: Curves.easeInOut,
      animationDuration: const Duration(milliseconds: 300),
      animateChildDecoration: true,
      rtlOpening: false,
      openScale: 1.0,
      disabledGestures: false,
      childDecoration: const BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(16)),
      ),
      child: WillPopScope(
        onWillPop: () => Future.value(false),
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Color(0xFF222831),
            elevation: 0.0,
            leading: IconButton(
              onPressed: _handleMenuButtonPressed,
              icon: ValueListenableBuilder<AdvancedDrawerValue>(
                valueListenable: _advancedDrawerController,
                builder: (_, value, __) {
                  return AnimatedSwitcher(
                    duration: Duration(milliseconds: 250),
                    child: Icon(
                      value.visible ? Icons.clear : Icons.menu,
                      key: ValueKey<bool>(value.visible),
                    ),
                  );
                },
              ),
            ),
          ),
          backgroundColor: Color(0xFF222831),
          body: _child,
          bottomNavigationBar: FluidNavBar(
            icons: [
              FluidNavBarIcon(
                  icon: Icons.home,
                  backgroundColor: Colors.red,
                  extras: {"label": "home", "index": 0}),
              FluidNavBarIcon(
                  icon: Icons.assignment,
                  backgroundColor: Colors.red,
                  extras: {"label": "assignment", "index": 1}),
              FluidNavBarIcon(
                  icon: Icons.account_circle,
                  backgroundColor: Colors.red,
                  extras: {"label": "account", "index": 2}),
            ],
            onChange: _handleNavigationChange,
            style: FluidNavBarStyle(
                iconSelectedForegroundColor: Colors.white,
                iconUnselectedForegroundColor: Colors.white60,
                barBackgroundColor: Colors.black),
            scaleFactor: 1.5,
            defaultIndex: currentIndex,
            itemBuilder: (icon, item) => Semantics(
              label: icon.extras!["label"],
              child: item,
            ),
          ),
        ),
      ),
      drawer: SafeArea(
        child: Container(
          child: ListTileTheme(
            textColor: Colors.white,
            iconColor: Colors.white,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  width: 128.0,
                  height: 128.0,
                  margin: const EdgeInsets.only(
                    top: 24.0,
                    bottom: 64.0,
                  ),
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    color: Colors.black26,
                    shape: BoxShape.circle,
                  ),
                  child: Image.asset(
                    'assets/images/logo.png',
                  ),
                ),
                ListTile(
                  onTap: () => {
                    _handleNavigationChange(0),
                    _advancedDrawerController.hideDrawer()
                  },
                  leading: Icon(Icons.home),
                  title: Text('Home'),
                ),
                ListTile(
                  onTap: () => {
                    _handleNavigationChange(1),
                    _advancedDrawerController.hideDrawer()
                  },
                  leading: Icon(Icons.description),
                  title: Text('Submit a Form'),
                ),
                ListTile(
                  onTap: () => {
                    _handleNavigationChange(2),
                    _advancedDrawerController.hideDrawer()
                  },
                  leading: Icon(Icons.account_circle_rounded),
                  title: Text('Profile'),
                ),
                Spacer(),
                ListTile(
                  onTap: userLogout,
                  leading: Icon(Icons.logout),
                  title: Text('Log Out'),
                ),
                DefaultTextStyle(
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.white54,
                  ),
                  child: Container(
                    margin: const EdgeInsets.symmetric(
                      vertical: 16.0,
                    ),
                    child: Text('Terms of Service | Privacy Policy'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _handleMenuButtonPressed() {
    // NOTICE: Manage Advanced Drawer state through the Controller.
    // _advancedDrawerController.value = AdvancedDrawerValue.visible();
    _advancedDrawerController.showDrawer();
  }
}
