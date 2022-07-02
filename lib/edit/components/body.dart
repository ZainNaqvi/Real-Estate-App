import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../widget/default.dart';
import '../../widget/suffixIcon.dart';
import '../../widget/validator.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  TextEditingController _userName = TextEditingController(text: "ZAin Haider");

  TextEditingController _userPhone = TextEditingController();
  TextEditingController _userAddress = TextEditingController();
  TextEditingController _userGender = TextEditingController();
  TextEditingController _userAge = TextEditingController();
  TextEditingController _userCountry = TextEditingController();

  bool isChecked = false;

  submitForm() {}

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
                "Change Your Profile ",
                style: TextStyle(
                  color: Colors.grey[800],
                  fontWeight: FontWeight.w600,
                  fontSize: 18.sp,
                ),
              ),
              SizedBox(
                height: 24.h,
              ),
              TextFormField(
                autocorrect: true,
                autofocus: true,
                controller: _userName,
                validator: passwordValidator,
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                  hintText: "Zain Haider Naqvi",
                  contentPadding: EdgeInsets.fromLTRB(20.w, 0, 0, 0),
                  enabledBorder: customOutlineBorder(),
                  focusedBorder: customOutlineBorder(),
                  border: customOutlineBorder(),
                ),
              ),
              SizedBox(
                height: 24.h,
              ),
              TextFormField(
                controller: _userAddress,
                validator: requiredField,
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                  hintText: "Address",
                  contentPadding: EdgeInsets.fromLTRB(20.w, 0, 0, 0),
                  enabledBorder: customOutlineBorder(),
                  focusedBorder: customOutlineBorder(),
                  border: customOutlineBorder(),
                ),
              ),
              SizedBox(
                height: 24.h,
              ),
              TextFormField(
                controller: _userCountry,
                validator: requiredField,
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                  hintText: "apsdfads",
                  contentPadding: EdgeInsets.fromLTRB(20.w, 0, 0, 0),
                  enabledBorder: customOutlineBorder(),
                  focusedBorder: customOutlineBorder(),
                  border: customOutlineBorder(),
                ),
              ),
              SizedBox(
                height: 24.h,
              ),
              TextFormField(
                controller: _userAge,
                validator: requiredField,
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                  hintText: "age",
                  contentPadding: EdgeInsets.fromLTRB(20.w, 0, 0, 0),
                  enabledBorder: customOutlineBorder(),
                  focusedBorder: customOutlineBorder(),
                  border: customOutlineBorder(),
                ),
              ),
              SizedBox(
                height: 24.h,
              ),
              TextFormField(
                controller: _userGender,
                validator: requiredField,
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                  hintText: "gender",
                  contentPadding: EdgeInsets.fromLTRB(20.w, 0, 0, 0),
                  enabledBorder: customOutlineBorder(),
                  focusedBorder: customOutlineBorder(),
                  border: customOutlineBorder(),
                ),
              ),
              SizedBox(
                height: 24.h,
              ),
              TextFormField(
                controller: _userPhone,
                validator: requiredField,
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                  hintText: "54654646",
                  contentPadding: EdgeInsets.fromLTRB(20.w, 0, 0, 0),
                  enabledBorder: customOutlineBorder(),
                  focusedBorder: customOutlineBorder(),
                  border: customOutlineBorder(),
                ),
              ),
              SizedBox(
                height: 24.h,
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
                height: 175.h,
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
