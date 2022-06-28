import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

AppBar customAppbar() {
  return AppBar(
    elevation: 0,
    iconTheme: IconThemeData(color: Colors.blue),
    backgroundColor: Colors.white,
    leading: Icon(Icons.arrow_back_ios),
    title: Text(
      "House",
      style: TextStyle(
        color: Colors.black,
        fontSize: 18.sp,
      ),
    ),
    actions: [
      Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 8.0.w,
        ),
        child: Container(
          margin: EdgeInsets.only(top: 8.h),
          width: 44.w,
          decoration: BoxDecoration(
            color: Colors.blue.withOpacity(0.08),
            borderRadius: BorderRadius.circular(14.r),
          ),
          child: Icon(Icons.search),
        ),
      ),
    ],
  );
}
