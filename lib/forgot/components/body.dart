import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        children: [
          Text(
            "Select which contact details should we use to reset your password. ",
            maxLines: 2,
            style: TextStyle(
              color: Colors.black,
              fontSize: 12.sp,
            ),
          ),
        ],
      ),
    );
  }
}
