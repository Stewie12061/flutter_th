import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:thflutter/signin/signinpage.dart';

class SplashPage extends StatelessWidget {
  static String routeName = "/splash";

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushNamedAndRemoveUntil(
          context, SignInPage.routeName, (Route<dynamic> route) => false);
    });

    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Colors.red,
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          // decoration: BoxDecoration(color: Colors.white),
          child: const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularProgressIndicator(
                backgroundColor: Colors.black,
                strokeWidth: 5,
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                "Loading...",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 18),
              )
            ],
          ),
        ),
      ),
    );
  }
}
