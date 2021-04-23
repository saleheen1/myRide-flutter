import 'package:flutter/material.dart';
import 'package:myride/views/Login/signUp.dart';
import 'package:myride/views/constants.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(30, 120, 30, 0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Passenger Login",
                  style: TextStyle(
                      color: Colors.green[600],
                      fontSize: 20,
                      fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: 30,
                ),
                TextField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                      labelText: "Email",
                      labelStyle: TextStyle(color: kGrey),
                      hintStyle: TextStyle(color: kGrey)),
                  style: TextStyle(color: kGrey),
                ),
                SizedBox(
                  height: 30,
                ),
                TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                      labelText: "Password",
                      labelStyle: TextStyle(color: kGrey),
                      hintStyle: TextStyle(color: kGrey)),
                  style: TextStyle(color: kGrey),
                ),
                SizedBox(
                  height: 30,
                ),
                FlatButton(
                  padding: EdgeInsets.all(14),
                  onPressed: () {},
                  color: Colors.green[400],
                  child: Text(
                    "Login",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                //sign up
                SizedBox(
                  height: 10,
                ),
                FlatButton(
                  padding: EdgeInsets.all(5),
                  onPressed: () {
                    Get.to(SignUp());
                  },
                  child: Text(
                    "Click here to Sign up",
                    style: TextStyle(color: kGrey),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
