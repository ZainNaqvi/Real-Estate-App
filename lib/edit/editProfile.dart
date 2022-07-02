import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:houses_olx/edit/components/body.dart';

class EditProfile extends StatelessWidget {
  static String routeName = "/resetPassword";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text(
          'Edit Profile',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w600,
            fontSize: 20.sp,
          ),
        ),
      ),
      body: Body(),
    );
  }
}
