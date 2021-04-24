import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myride/main.dart';
import 'package:myride/views/Login/login.dart';
import 'package:myride/views/Others/progressDialog.dart';
import 'package:myride/views/constants.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:myride/views/home.dart';

class SignUp extends StatelessWidget {
  TextEditingController nameEditingController = TextEditingController();
  TextEditingController emailEditingController = TextEditingController();
  TextEditingController phoneEditingController = TextEditingController();
  TextEditingController passwordEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
    void registerNewUser(BuildContext context) async {
      showDialog(
          barrierDismissible: false,
          builder: (BuildContext context) {
            return ProgressDialog(
              message: "Please wait",
            );
          },
          context: context);
      final User firebaseUser = (await _firebaseAuth
              .createUserWithEmailAndPassword(
                  email: emailEditingController.text,
                  password: passwordEditingController.text)
              .catchError((errMsg) {
        Navigator.pop(context);
        displayToast("Error ${errMsg.toString()}");
      }))
          .user;

      if (firebaseUser != null) {
        //save user info into database

        Map userDataMap = {
          "name": nameEditingController.text
              .trim(), //if we don't use trim, if user uses extra space then there will be an error
          "email": emailEditingController.text.trim(),
          "phone": phoneEditingController.text.trim(),
        };
        usersRef.child(firebaseUser.uid).set(userDataMap);
        displayToast("Account created successfully");
        Get.offAll(HomePage());
      } else {
        Navigator.pop(context);
        displayToast("User was not created");
      }
    }

    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: kGrey),
        titleSpacing: 0,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
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
                  controller: nameEditingController,
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
                TextField(
                  controller: phoneEditingController,
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
                  onPressed: () {
                    if (nameEditingController.text.length < 4) {
                      //name must be greater than 4 character
                      displayToast("Name must be 4 or more characters");
                    } else if (!emailEditingController.text.contains("@")) {
                      displayToast("Invalid email");
                    } else if (phoneEditingController.text.isEmpty) {
                      displayToast("Phone number must be entered");
                    } else if (passwordEditingController.text.length < 6) {
                      displayToast("Password must be 6 or more characters");
                    } else {
                      registerNewUser(context);
                    }
                  },
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
