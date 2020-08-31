import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:simple_login_register/User.dart';
import 'package:simple_login_register/utils/ViewUtils.dart';

import 'Home.dart';
import 'register.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool checkLogin(User user) {
    if (user.name == "admin" && user.password == "admin") {
      return true;
    } else {
      return false;
    }
  }

  TextEditingController userController = TextEditingController();
  TextEditingController passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body: Form(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "LOGIN",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 38,
                    color: Colors.white),
              ),
              TextFormField(
                  controller: userController,
                  decoration: InputDecoration(
                    hintText: "Username",
                    hintStyle: TextStyle(color: Colors.white),
                  )),
              TextFormField(
                controller: passController,
                obscureText: true,
                decoration: InputDecoration(
                  hintText: "Password",
                  hintStyle: TextStyle(color: Colors.white),
                ),
              ),
              SizedBox(
                width: 150,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: RaisedButton(
                    onPressed: () {
                      print("Login Clicked");

                      User user = new User();

                      setState(() {
                        user.name = userController.text;
                        user.password = passController.text;
                      });

                      if (checkLogin(user)) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Home(user)));
                      } else {
                        //user or pass wrong
                        ViewUtils().showToast("Password atau Username Salah");
                      }
                    },
                    child: Text(
                      "LOGIN",
                      style: TextStyle(
                          fontSize: 18, color: Colors.blueGrey.shade900),
                    ),
                  ),
                ),
              ),
              InkWell(
                child: Text(
                  "Register",
                  style: TextStyle(color: Colors.white),
                ),
                onTap: () {
                  print("register clicked");
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Register()));
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
