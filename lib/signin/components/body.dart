import 'package:flutter/material.dart';
import 'package:thflutter/signin/components/signin_form.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: SingleChildScrollView(
      child: Container(
        color: Colors.white12,
        child: Column(
          children: [
            headerScreen(context),
            SignInForm()
          ],
        ),
      ),
    ));
  }

  Widget headerScreen(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.4,
        alignment: Alignment.topCenter,
        child: Image.network(
            'https://www.eatingwell.com/thmb/m5xUzIOmhWSoXZnY-oZcO9SdArQ=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/article_291139_the-top-10-healthiest-foods-for-kids_-02-4b745e57928c4786a61b47d8ba920058.jpg'));
  }

}
