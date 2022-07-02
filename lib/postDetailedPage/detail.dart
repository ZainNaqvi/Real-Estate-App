import 'package:flutter/material.dart';
import 'package:houses_olx/postDetailedPage/component/body.dart';
import 'package:houses_olx/widget/bottomnavigation/bottomappbar.dart';
import 'package:houses_olx/widget/customBottomNavigation.dart';

class PostDetailedPage extends StatelessWidget {
  final snap;
  PostDetailedPage({
    Key? key,
    required this.snap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Body(
          snap: snap,
        ),
      ),
      bottomNavigationBar: bottomapp(snap: snap),
    );
  }
}
