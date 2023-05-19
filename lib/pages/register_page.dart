import 'package:flutter/material.dart';

import 'home_page.dart';
import 'login_page.dart';

import '../components/text_input_field.dart';
import '../components/custom_button.dart';
import '../components/animated_box.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final accTypeController = TextEditingController();
  final nameController = TextEditingController();
  final surnameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  String _dropdownvalue = 'Public';
  bool _TCsIsChecked = false;

  // List of items in our dropdown menu
  var items = ['Public', 'Service Provider'];

  void register() async {
    print(accTypeController.text);
    print(nameController.text);

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

  void login_screen() async {
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

  void clicked(String h) {
    print(h);
  }

  @override
  Widget build(BuildContext context) {
    Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };
      if (states.any(interactiveStates.contains)) {
        return Colors.white;
      }
      return Colors.white;
    }

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
                  height: 50,
                  color: Color(0x00000000),
                ),
                Stack(
                  children: [
                    AnimatedBox(borderColor: Colors.blue, rotateAngle: 0),
                    AnimatedBox(borderColor: Colors.red, rotateAngle: 5.0),
                  ],
                ),
                Divider(
                  height: 15,
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
                      "Create Account",
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Divider(
                  height: 20,
                  color: Color(0x00000000),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    DropdownButton(
                      // Initial Value
                      value: _dropdownvalue,

                      // Down Arrow Icon
                      icon: const Icon(Icons.keyboard_arrow_down),

                      // Array list of items
                      items: items.map((String items) {
                        return DropdownMenuItem(
                          value: items,
                          child: Text(items),
                        );
                      }).toList(),
                      // After selecting the desired option,it will
                      // change button value to selected value
                      onChanged: (String? newValue) {
                        setState(() {
                          _dropdownvalue = newValue!;
                        });
                      },
                    ),
                  ],
                ),
                Divider(
                  height: 2,
                  color: Color(0x00000000),
                ),
                UserInput(
                    controller: nameController,
                    inputLabel: "First Name",
                    hintText: "John",
                    obscureText: false),
                Divider(
                  height: 2,
                  color: Color(0x00000000),
                ),
                UserInput(
                    controller: surnameController,
                    inputLabel: "Surname",
                    hintText: "Doe",
                    obscureText: false),
                Divider(
                  height: 2,
                  color: Color(0x00000000),
                ),
                UserInput(
                    controller: emailController,
                    inputLabel: "Email Address",
                    hintText: "john.doe@example.com",
                    obscureText: false),
                Divider(
                  height: 2,
                  color: Color(0x00000000),
                ),
                UserInput(
                    controller: phoneController,
                    inputLabel: "Phone Number",
                    hintText: "0123456789",
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
                UserInput(
                    controller: confirmPasswordController,
                    inputLabel: "Repeat Password",
                    hintText: "",
                    obscureText: true),
                Divider(
                  height: 2,
                  color: Color(0x00000000),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Checkbox(
                      value: _TCsIsChecked,
                      checkColor: Colors.grey,
                      fillColor: MaterialStateProperty.resolveWith(getColor),
                      onChanged: (bool? value) {
                        setState(() {
                          _TCsIsChecked = value ?? false;
                        });
                      },
                    ),
                    GestureDetector(
                      onTap: login_screen,
                      child: RichText(
                        text: TextSpan(
                          text: 'By subscribing, you agree to our ',
                          style: TextStyle(color: Colors.white),
                          children: <TextSpan>[
                            TextSpan(
                              text: 'terms & conditions',
                              style: TextStyle(
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Divider(
                  height: 45,
                  color: Color(0x00000000),
                ),
                CustomButton(onTap: register, label: "Register"),
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
                        onTap: login_screen,
                        child: RichText(
                          text: TextSpan(
                            text: 'Already have an account? ',
                            style: TextStyle(color: Colors.white),
                            children: <TextSpan>[
                              TextSpan(
                                text: 'Sign In',
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
                  height: 20,
                  color: Color(0x00000000),
                ),
                Container(
                  alignment: Alignment.bottomCenter,
                  child: Text("Powered by Simplifly"),
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
