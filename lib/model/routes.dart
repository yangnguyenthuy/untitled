

import 'package:flutter/widgets.dart';
import 'package:untitled/detail/productpage.dart';
import 'package:untitled/homepage/homepage.dart';
import 'package:untitled/signup/signuppage.dart';
import 'package:untitled/splashpage.dart';
import 'package:untitled/signin/signinpage.dart';
import 'package:untitled/cart/cartpage.dart';

final Map<String, WidgetBuilder> routes = {
  SplashPage.routeName: (context) => SplashPage(),
  SignInPage.routeName: (context) => SignInPage(),
  SignUpPage.routeName: (context) => SignUpPage(),
  HomePage.routeName: (context) => HomePage(),
  ProductPage.routeName: (context) => ProductPage(),
  CartPage.routeName: (context) => CartPage(),
};