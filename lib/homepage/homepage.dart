import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:thflutter/homepage/components/body.dart';

class HomePage extends StatelessWidget{
  int selectIndex = 0;
  static String routeName = "/home_screen";

  @override
  Widget build(BuildContext context) {
    return Body();
  }
}
