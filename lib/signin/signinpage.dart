

import 'package:flutter/material.dart';
import 'package:thflutter/signin/components/body.dart';

class SignInPage extends StatelessWidget {

 static String routeName = "/signin";
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      resizeToAvoidBottomInset: false,
      body: Body(),
    );
  }
}