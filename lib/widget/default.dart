import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

ElevatedButton defaultButton(
    {required String text, required VoidCallback press}) {
  return ElevatedButton(
    clipBehavior: Clip.antiAlias,
    style: ElevatedButton.styleFrom(
      shape: StadiumBorder(),
      primary: Colors.blue,
      minimumSize: Size(double.infinity, 46.h),
    ),
    onPressed: press,
    child: Text(
      text,
      style: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
        fontSize: 22.sp,
      ),
    ),
  );
}
