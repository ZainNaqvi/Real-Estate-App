import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../widget/suffixIcon.dart';
import '../../widget/validator.dart';

class FormFields extends StatefulWidget {
  const FormFields({Key? key}) : super(key: key);

  @override
  State<FormFields> createState() => _FormFieldsState();
}

class _FormFieldsState extends State<FormFields> {
  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.0.w),
            child: Text(
              "Email",
              style: TextStyle(
                color: Colors.grey[800],
                fontWeight: FontWeight.w600,
                fontSize: 16.sp,
              ),
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          TextFormField(
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
            child: Text(
              "Password",
              style: TextStyle(
                color: Colors.grey[800],
                fontWeight: FontWeight.w600,
                fontSize: 16.sp,
              ),
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          TextFormField(
            validator: emailValidator,
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.next,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.fromLTRB(20.w, 0, 0, 0),
              hintText: "Password",
              enabledBorder: customOutlineBorder(),
              focusedBorder: customOutlineBorder(),
              border: customOutlineBorder(),
            ),
          ),
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
