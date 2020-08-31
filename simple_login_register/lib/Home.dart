import 'package:flutter/material.dart';

import 'User.dart';

class Home extends StatelessWidget {
  User user;

  Home(this.user);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  "Selamat datang ",
                  style: TextStyle(color: Colors.teal.shade900, fontSize: 20),
                ),
                Icon(
                  Icons.account_circle_rounded,
                  size: 100,
                  color: Colors.teal.shade900,
                ),
                Text(
                  user.name,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.teal.shade900,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
                Text("your password is " + user.password)
              ],
            ),
            RaisedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("Log Out"),
            )
          ],
        ),
      ),
    );
  }
}
