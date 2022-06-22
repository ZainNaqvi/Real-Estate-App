import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:houses_olx/widget/default.dart';

import '../../widget/suffixIcon.dart';
import '../../widget/validator.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  TextEditingController _userNewPasswordController = TextEditingController();
  TextEditingController _userCPasswordController = TextEditingController();
  bool isObscure = true;
  bool isPObscure = true;
  bool isChecked = true;
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _userNewPasswordController.dispose();
    _userCPasswordController.dispose();
  }

  submitForm() {
    print(_userNewPasswordController.text);
    print(_userCPasswordController.text);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 14.h),
        child: Form(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Create a new password",
                style: TextStyle(
                  color: Colors.grey[800],
                  fontWeight: FontWeight.w600,
                  fontSize: 18.sp,
                ),
              ),
              SizedBox(
                height: 24.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.0.w),
                child: Row(
                  children: [
                    Text(
                      "New Password",
                      style: TextStyle(
                        color: Colors.grey[800],
                        fontWeight: FontWeight.w600,
                        fontSize: 16.sp,
                      ),
                    ),
                    Text(
                      "*",
                      style: TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.w600,
                        fontSize: 16.sp,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              TextFormField(
                obscureText: isPObscure,
                controller: _userNewPasswordController,
                validator: passwordValidator,
                keyboardType: TextInputType.visiblePassword,
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                  hintText: "New Password",
                  contentPadding: EdgeInsets.fromLTRB(20.w, 0, 0, 0),
                  enabledBorder: customOutlineBorder(),
                  focusedBorder: customOutlineBorder(),
                  border: customOutlineBorder(),
                  suffixIcon: suffixicon(
                    press: () {
                      setState(() {
                        isPObscure = !isPObscure;
                      });
                    },
                    icon: Icons.remove_red_eye,
                  ),
                ),
              ),
              SizedBox(
                height: 24.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.0.w),
                child: Row(
                  children: [
                    Text(
                      "Confirm Password",
                      style: TextStyle(
                        color: Colors.grey[800],
                        fontWeight: FontWeight.w600,
                        fontSize: 16.sp,
                      ),
                    ),
                    Text(
                      "*",
                      style: TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.w600,
                        fontSize: 16.sp,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              TextFormField(
                controller: _userCPasswordController,
                validator: passwordValidator,
                keyboardType: TextInputType.visiblePassword,
                textInputAction: TextInputAction.next,
                obscureText: isObscure,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.fromLTRB(20.w, 0, 0, 0),
                  hintText: "Confirm New Password",
                  enabledBorder: customOutlineBorder(),
                  suffixIcon: suffixicon(
                      press: () {
                        setState(() {
                          isObscure = !isObscure;
                        });
                      },
                      icon: Icons.remove_red_eye),
                  focusedBorder: customOutlineBorder(),
                  border: customOutlineBorder(),
                ),
              ),
              SizedBox(
                height: 16.h,
              ),
              Row(
                children: [
                  Checkbox(
                    value: isChecked,
                    onChanged: (value) {
                      setState(() {
                        isChecked = !isChecked;
                      });
                    },
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.r),
                    ),
                    side: BorderSide(
                      color: Colors.blue,
                    ),
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  Text(
                    "Remember me",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 250.h,
              ),
              defaultButton(
                  text: "Save",
                  press: () {
                    submitForm();
                  }),
            ],
          ),
        ),
      ),
    );
  }

  OutlineInputBorder customOutlineBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(40),
      borderSide: BorderSide(color: Colors.grey),
    );
  }
}
