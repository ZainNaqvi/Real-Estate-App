import 'package:flutter/material.dart';
import 'package:houses_olx/signin/signin.dart';
import 'package:houses_olx/splashScreen/splashscreen.dart';

final Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (context) => SplashScreen(),
  SignIn.routeName: (context) => SignIn(),
};
