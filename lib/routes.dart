import 'package:flutter/material.dart';
import 'package:houses_olx/feed/feedScreen.dart';
import 'package:houses_olx/home/home.dart';
import 'package:houses_olx/lottie/splash.dart';
import 'package:houses_olx/signin/signin.dart';
import 'package:houses_olx/signup/signup.dart';
import 'package:houses_olx/smsOTP/forgotPassword.dart';
import 'package:houses_olx/splashScreen/splashscreen.dart';
import 'forgot/forgotPassword.dart';

final Map<String, WidgetBuilder> routes = {
  Lottie.routeName: (context) => Lottie(),
  SplashScreen.routeName: (context) => SplashScreen(),
  SignUp.routeName: (context) => SignUp(),
  Signin.routeName: (context) => Signin(),
  ForgotScreen.routeName: (context) => ForgotScreen(),
  SmsOTP.routeName: (context) => SmsOTP(),
  FeedScreen.routeName: (context) => FeedScreen(),
  HomeScreen.routeName: (context) => HomeScreen(),
};
