import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
// import 'package:thflutter/signup/signupscreen.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'components/body.dart';

class SignInPage extends StatelessWidget {
  static String routeName = "/sign_in";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Body(),
    );
  }

}
