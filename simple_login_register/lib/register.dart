import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Register extends StatelessWidget {
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
                "REGISTER",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 38,
                    color: Colors.white),
              ),
              TextFormField(
                  decoration: InputDecoration(
                hintText: "Username",
                hintStyle: TextStyle(color: Colors.white),
              )),
              TextFormField(
                obscureText: true,
                decoration: InputDecoration(
                  hintText: "Password",
                  hintStyle: TextStyle(color: Colors.white),
                ),
              ),
              TextFormField(
                  decoration: InputDecoration(
                hintText: "Name",
                hintStyle: TextStyle(color: Colors.white),
              )),
              TextFormField(
                  decoration: InputDecoration(
                hintText: "Phone Numbe",
                hintStyle: TextStyle(color: Colors.white),
              )),
              SizedBox(
                width: 150,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: RaisedButton(
                    onPressed: () {
                      print("REGISTER Clicked");
                    },
                    child: Text(
                      "REGISTER",
                      style: TextStyle(
                          fontSize: 18, color: Colors.blueGrey.shade900),
                    ),
                  ),
                ),
              ),
              InkWell(
                child: Text(
                  "Login",
                  style: TextStyle(color: Colors.white),
                ),
                onTap: () {
                  print("Login clicked");
                  Navigator.pop(context);
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
