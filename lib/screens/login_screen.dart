import 'package:flutter/material.dart';

import 'home_screen.dart';

TextStyle myStyle = const TextStyle(fontSize: 25);

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late String username;
  late String password;

  @override
  Widget build(BuildContext context) {
    final usernameFeild = TextField(
      onChanged: (val) {
        setState(() {
          username = val;
        });
      },
      style: myStyle,
      decoration: InputDecoration(
          contentPadding: const EdgeInsets.all(10),
          hintText: "Username",
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
    );

    final passswordFeild = TextField(
      onChanged: (val) {
        setState(() {
          password = val;
        });
      },
      obscureText: true,
      style: myStyle,
      decoration: InputDecoration(
          contentPadding: const EdgeInsets.all(10),
          hintText: "Password",
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
    );

    final myLoginButton = Material(
        elevation: 5.0,
        borderRadius: BorderRadius.circular(30.0),
        color: Colors.blue,
        child: MaterialButton(
          minWidth: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.all(20),
          onPressed: () {
            if (username == "admin" && password == "admin") {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => HomeScreen(username)));
            } else {
              print("Login Failed");
            }
          },
          child: const Text(
            'Login',
            style: TextStyle(color: Colors.white, fontSize: 25),
          ),
        ));
    return Scaffold(
      body: Center(
        child: Container(
          color: Colors.white,
          child: Padding(
              padding: const EdgeInsets.all(20),
              child: ListView(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    //crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.supervised_user_circle,
                        size: 100,
                      ),
                      const SizedBox(height: 150),
                      usernameFeild,
                      const SizedBox(height: 10),
                      passswordFeild,
                      const SizedBox(height: 10),
                      myLoginButton,
                      const SizedBox(
                        height: 25,
                      ),
                      const Text(
                        'User: admin Password: admin',
                        style: TextStyle(color: Colors.black, fontSize: 20),
                      )
                    ],
                  ),
                ],
              )),
        ),
      ),
    );
  }
}
