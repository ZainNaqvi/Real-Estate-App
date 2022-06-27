import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Row header() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                "Location",
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
              SizedBox(
                width: 5.w,
              ),
              Icon(
                Icons.keyboard_arrow_down_outlined,
                color: Colors.grey,
              ),
            ],
          ),
          SizedBox(
            height: 8.h,
          ),
          Row(
            children: [
              Icon(
                Icons.location_on,
                color: Colors.blue,
              ),
              SizedBox(
                width: 16.w,
              ),
              Text(
                "Pakistan , Wah Cantt",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ],
      ),
      Container(
          width: 44.w,
          height: 44.h,
          decoration: BoxDecoration(
              color: Colors.blue.withOpacity(
                0.04,
              ),
              borderRadius: BorderRadius.circular(10.r)),
          child: Icon(
            Icons.notifications,
            color: Colors.blue,
          )),
    ],
  );
}
