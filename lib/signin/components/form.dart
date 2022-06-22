import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:houses_olx/widget/default.dart';

import '../../widget/suffixIcon.dart';
import '../../widget/validator.dart';

class FormFields extends StatefulWidget {
  const FormFields({Key? key}) : super(key: key);

  @override
  State<FormFields> createState() => _FormFieldsState();
}

class _FormFieldsState extends State<FormFields> {
  TextEditingController _userEmailController = TextEditingController();
  TextEditingController _userPasswordController = TextEditingController();
  bool isObscure = true;
  bool isChecked = true;
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _userEmailController.dispose();
    _userPasswordController.dispose();
  }

  submitForm() {
    print(_userEmailController.text);
    print(_userPasswordController.text);
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.0.w),
            child: Row(
              children: [
                Text(
                  "Email",
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
            controller: _userEmailController,
            validator: emailValidator,
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.next,
            decoration: InputDecoration(
              hintText: "Email",
              contentPadding: EdgeInsets.fromLTRB(20.w, 0, 0, 0),
              enabledBorder: customOutlineBorder(),
              focusedBorder: customOutlineBorder(),
              border: customOutlineBorder(),
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
                  "Password",
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
            controller: _userPasswordController,
            validator: passwordValidator,
            keyboardType: TextInputType.visiblePassword,
            textInputAction: TextInputAction.next,
            obscureText: isObscure,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.fromLTRB(20.w, 0, 0, 0),
              hintText: "Password",
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
            height: 10.h,
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
            height: 16.h,
          ),
          defaultButton(
              text: "Sign in",
              press: () {
                submitForm();
              }),
        ],
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
