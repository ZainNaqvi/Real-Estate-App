import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:houses_olx/feed/feedScreen.dart';
import 'package:houses_olx/splashScreen/splashscreen.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

import '../../provider/userProviders.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> with SingleTickerProviderStateMixin {
  // Animation controller
  late AnimationController _animationController;
  @override
  void initState() {
    _animationController = AnimationController(
        vsync: this,
        duration: Duration(
          seconds: 10,
        ));

    _animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        // Get the firebase user
        User? firebaseUser = FirebaseAuth.instance.currentUser;
// Define a widget
        Widget firstWidget;

// Assign widget based on availability of currentUser
        if (firebaseUser != null) {
          firstWidget = FeedScreen();
        } else {
          firstWidget = SplashScreen();
        }
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => firstWidget),
        );
      }
      ;
    });
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Lottie.asset(
        "assets/lottie/house.json",
        controller: _animationController,
        onLoaded: (compostion) {
          _animationController.forward();
        },
      ),
    );
  }
}
