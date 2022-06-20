import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:houses_olx/signin/components/form.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
      child: Column(
        children: [
          Image.asset("assets/images/splash_3.png"),
          SizedBox(
            height: 10.h,
          ),
          Text(
            "Sign up for free",
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w500,
              fontSize: 24.sp,
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          FormFields(),
        ],
      ),
    );
  }
}
