import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:houses_olx/signin/components/form.dart';
import 'package:houses_olx/widget/footer.dart';
import 'package:houses_olx/widget/sociallinks.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
      child: SingleChildScrollView(
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
              height: 24.h,
            ),
            FormFields(),
            SizedBox(
              height: 24.h,
            ),
            Row(
              children: [
                Expanded(
                  child: Divider(
                    color: Colors.grey,
                  ),
                ),
                SizedBox(
                  width: 10.w,
                ),
                Text("or Continue with"),
                SizedBox(
                  width: 10.w,
                ),
                Expanded(
                  child: Divider(
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 16.h,
            ),
            SocialLinks(),
            SizedBox(
              height: 16.h,
            ),
            footer(
              text: "Already have an account? ",
              press: () {},
              linkText: "Sign in",
              color: Colors.grey,
              linkColor: Colors.blue,
            )
          ],
        ),
      ),
    );
  }
}
