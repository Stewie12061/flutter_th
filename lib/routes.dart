import 'dart:js';

import 'package:flutter/widgets.dart';
import 'package:thflutter/detail/productpage.dart';
import 'package:thflutter/homepage/homepage.dart';
import 'package:thflutter/main.dart';
import 'package:thflutter/signup/signup_page.dart';
// import 'package:thflutter/signup/signupscreen.dart';
import 'package:thflutter/splashpage.dart';
import 'package:thflutter/signin/signinpage.dart';

import 'cart/cartpage.dart';

final Map<String, WidgetBuilder> routes = {
  SplashPage.routeName:(context) => SplashPage(),
  SignInPage.routeName:(context) => SignInPage(),
  SignUpPage.routeName:(context) => SignUpPage(),
  HomePage.routeName:(context) => HomePage(),
  ProductPage.routeName:(context) => ProductPage(),
  CartPage.routeName:(context) => CartPage(),
};