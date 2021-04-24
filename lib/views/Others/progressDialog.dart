import 'package:flutter/material.dart';
import 'package:myride/views/constants.dart';

class ProgressDialog extends StatelessWidget {
  String message;
  ProgressDialog({this.message});
  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.white,
      child: Container(
        margin: EdgeInsets.all(15),
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(
            children: [
              CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation(Colors.black),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8),
                child: Text(
                  message,
                  style: TextStyle(color: kGrey),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
