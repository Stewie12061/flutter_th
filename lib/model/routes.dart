

import 'package:flutter/material.dart';

import 'package:flutter/widgets.dart';
import 'package:thflutter/model/splashpage.dart';
import 'package:thflutter/signin/signinpage.dart';
import 'package:thflutter/signup/signuppage.dart';

import '../cart/cartpage.dart';
import '../detail/productpage.dart';
import '../homepage/homepage.dart';


final Map<String, WidgetBuilder> routes = {
  SplashPage.routeName: (context) => SplashPage(),
  SignInPage.routeName: (context) => SignInPage(),
  SignUpPage.routeName: (context) => SignUpPage(),
  HomePage.routeName: (context) => HomePage(),
  CartPage.routeName: (context) => CartPage(),
  ProductPage.routeName: (context) => ProductPage(),
};
