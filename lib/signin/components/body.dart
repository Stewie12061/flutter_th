import 'package:flutter/material.dart';
import 'package:thflutter/signin/components/signin_form.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: SingleChildScrollView(
      child: Container(
        child: Column(
          children: [
            headerScreen(context),
            SignInForm(),
            footerScreen(context),
          ],
        ),
      ),
    ));
  }

  Widget headerScreen(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.2,
        alignment: Alignment.bottomRight,
        child: Image.network(
            'https://images.immediate.co.uk/production/volatile/sites/30/2020/08/processed-food700-350-e6d0f0f.jpg'));
  }

  Widget footerScreen(BuildContext context) {
    return Container(
      height: 200,
      alignment: Alignment.bottomLeft,
      child: Image.network(
          'https://images.immediate.co.uk/production/volatile/sites/30/2020/08/processed-food700-350-e6d0f0f.jpg'),
    );
  }
}
