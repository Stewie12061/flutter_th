import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:thflutter/signup/components/signup_form.dart';


class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Container(
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            Text("Register Account", style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.green, height: 1.5),),
            Text(
              "Complete your details or continue \n with social media",
              textAlign: TextAlign.center,
              style: TextStyle(color: Color(0xFF4caf50),),
            ),
            SignUpForm(),
            ]
        ),),
    ));
  }
}

