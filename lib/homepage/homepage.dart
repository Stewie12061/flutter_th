import 'package:flutter/material.dart';

import 'components/body.dart';


class HomePage extends StatelessWidget {
  //int selectIndex = 0;
  static String routeName = '/home_sreen';

  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Body();
  }
}


