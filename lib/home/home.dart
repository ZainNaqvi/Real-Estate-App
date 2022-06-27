import 'package:flutter/material.dart';
import 'package:houses_olx/home/components/body.dart';

class HomeScreen extends StatelessWidget {
  static String routeName = "/homeScreen";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
    );
  }
}
