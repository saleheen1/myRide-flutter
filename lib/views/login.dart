import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Text(
            "Passenger Login",
            style: TextStyle(color: Colors.grey),
          )
        ],
      ),
    );
  }
}
