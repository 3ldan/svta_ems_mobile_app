import 'package:flutter/material.dart';

import 'home_page.dart';
import 'register_page.dart';

import '../components/text_input_field.dart';
import '../components/custom_button.dart';
import '../components/animated_box.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  void login() async {
    var navigationResult = await Navigator.push(
        context, new MaterialPageRoute(builder: (context) => HomePage()));

    if (navigationResult == true) {
      showDialog(
          context: context,
          builder: (context) => AlertDialog(
                title: Text("Hello World"),
              ));
    }
  }

  void register_screen() async {
    var navigationResult = await Navigator.push(
        context, new MaterialPageRoute(builder: (context) => RegisterPage()));

    if (navigationResult == true) {
      showDialog(
          context: context,
          builder: (context) => AlertDialog(
                title: Text("Hello World"),
              ));
    }
  }

  void clicked(String h) {
    print(h);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: const Color(0x00222831),
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Divider(
                  height: 30,
                  color: Color(0x00000000),
                ),
                Stack(
                  children: [
                    AnimatedBox(borderColor: Colors.blue, rotateAngle: 0),
                    AnimatedBox(borderColor: Colors.red, rotateAngle: 5.0),
                  ],
                ),
                Divider(
                  height: 30,
                  color: Color(0x00000000),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "SVTA EMS",
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 5),
                    Text(
                      "Login",
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Divider(
                  height: 20,
                  color: Color(0x00000000),
                ),
                UserInput(
                    controller: usernameController,
                    inputLabel: "Username",
                    hintText: "john.doe@example.com",
                    obscureText: false),
                Divider(
                  height: 2,
                  color: Color(0x00000000),
                ),
                UserInput(
                    controller: passwordController,
                    inputLabel: "Password",
                    hintText: "",
                    obscureText: true),
                Divider(
                  height: 2,
                  color: Color(0x00000000),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 35.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GestureDetector(
                          onTap: () => clicked("forgot_password"),
                          child: Text("Forgot Password?")),
                    ],
                  ),
                ),
                Divider(
                  height: 45,
                  color: Color(0x00000000),
                ),
                CustomButton(onTap: login, label: "Log In"),
                Divider(
                  height: 25,
                  color: Color(0x00000000),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 35.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: register_screen,
                        child: RichText(
                          text: TextSpan(
                            text: 'Don\'t have an account? ',
                            style: TextStyle(color: Colors.white),
                            children: <TextSpan>[
                              TextSpan(
                                text: 'Sign Up',
                                style: TextStyle(
                                  fontSize: 18,
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Divider(
                  height: 50,
                  color: Color(0x00000000),
                ),
                Container(
                  alignment: Alignment.bottomCenter,
                  child: Text(
                    "Powered by Simplifly",
                    style: TextStyle(fontSize: 12),
                  ),
                ),
                Divider(
                  height: 10,
                  color: Color(0x00000000),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
