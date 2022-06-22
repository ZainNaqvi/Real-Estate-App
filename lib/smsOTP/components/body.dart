import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:houses_olx/otp/otpScreen.dart';

import '../../widget/customOutlineBorder.dart';
import '../../widget/default.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  TextEditingController _userNumberController = TextEditingController();
  @override
  void dispose() {
    _userNumberController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 160.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 24.h,
            ),
            Column(
              children: [
                Text(
                  "Enter the number here we will send a code\non this to verify it. ",
                  maxLines: 2,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 12.sp,
                  ),
                ),
                SizedBox(
                  height: 24.h,
                ),
                TextFormField(
                  controller: _userNumberController,
                  keyboardType: TextInputType.number,
                  textInputAction: TextInputAction.done,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.fromLTRB(20.w, 0, 0, 0),
                    hintText: "Phone number",
                    enabledBorder: customOutlineBorder(),
                    suffixIcon: null,
                    prefixIcon: Icon(Icons.phone),
                    focusedBorder: customOutlineBorder(),
                    border: customOutlineBorder(),
                  ),
                ),
                SizedBox(
                  height: 72.h,
                ),
                defaultButton(
                    text: "Send",
                    press: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => OtpScreen(
                          value: _userNumberController.text,
                        ),
                      ));
                    }),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
