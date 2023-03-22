import 'dart:js';

import 'package:flutter/widgets.dart';
//import 'package:untitled/'; //productpage
//import 'package:untitled/'; //homepage
import 'package:untitled/signup/signuppage.dart';
import 'package:untitled/splashpage.dart';
import 'package:untitled/signin/signinpage.dart';

final Map<String, Widget> routes = {
  SplashPage.routeName: (context) => SplashPage(),
  SignInPage.routeName: (context) => SignInPage(),
  SignUpPage.routeName: (context) => SignUpPage(),
  //SplashPage.routeName: (context) => SplashPage(),
  //SplashPage.routeName: (context) => SplashPage(),
  //SplashPage.routeName: (context) => SplashPage(),
};