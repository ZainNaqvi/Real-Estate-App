import 'package:flutter/material.dart';
import 'package:houses_olx/home/components/body.dart';
import 'package:houses_olx/models/users.dart';
import 'package:houses_olx/provider/userProviders.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  static String routeName = "/homeScreen";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
    );
  }
}
