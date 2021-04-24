import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:myride/views/Login/signUp.dart';
import 'package:myride/views/constants.dart';
import 'package:get/get.dart';

import '../../main.dart';
import '../home.dart';

class LoginScreen extends StatelessWidget {
  TextEditingController emailEditingController = TextEditingController();
  TextEditingController passwordEditingController = TextEditingController();

  displayToast(message) {
    return Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.black,
        fontSize: 16.0);
  }

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  void loginAndAuthUser() async {
    final User firebaseUserLogin = (await _firebaseAuth
            .signInWithEmailAndPassword(
                email: emailEditingController.text,
                password: passwordEditingController.text)
            .catchError((errMsg) {
      displayToast("Error");
    }))
        .user;

    if (firebaseUserLogin != null) {
      //save user info into database
      usersRef.child(firebaseUserLogin.uid).once().then((DataSnapshot snap) {
        if (snap.value != null) {
          Get.off(HomePage());
          displayToast("Successfully logged in");
        } else {
          _firebaseAuth.signOut();
          displayToast("No record found");
        }
      });
    } else {
      displayToast("Error sign in");
    }
  }

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
                  controller: emailEditingController,
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
                  controller: passwordEditingController,
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
                  onPressed: () {
                    if (!emailEditingController.text.contains("@")) {
                      displayToast("Invalid email");
                    } else if (passwordEditingController.text.isEmpty) {
                      displayToast("Password can not be empty");
                    } else {
                      loginAndAuthUser();
                    }
                  },
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
