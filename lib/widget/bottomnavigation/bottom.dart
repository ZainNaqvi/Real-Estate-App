import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Container bottom() {
  return Container(
    height: 60.h,
    width: 180.w,
    decoration: BoxDecoration(
      color: Colors.green,
      borderRadius: BorderRadius.circular(20),
    ),
    child: Center(
      child: Text(
        "Check Out",
        style: TextStyle(
          color: Colors.white,
          fontSize: 20.sp,
        ),
      ),
    ),
  );
}
