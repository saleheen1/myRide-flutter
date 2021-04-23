import 'package:flutter/material.dart';
import 'package:myride/views/constants.dart';

class SignUp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(30, 90, 30, 0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Registration",
                  style: TextStyle(
                      color: Colors.green[600],
                      fontSize: 20,
                      fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: 30,
                ),
                TextField(
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                      labelText: "Name",
                      labelStyle: TextStyle(color: kGrey),
                      hintStyle: TextStyle(color: kGrey)),
                  style: TextStyle(color: kGrey),
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
                TextField(
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                      labelText: "Phone",
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
                    "Signup",
                    style: TextStyle(color: Colors.white),
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
