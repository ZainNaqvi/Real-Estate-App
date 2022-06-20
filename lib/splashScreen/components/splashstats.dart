import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class splashStats extends StatelessWidget {
  splashStats({
    Key? key,
    required this.title,
    required this.desc,
    required this.imageURL,
  }) : super(key: key);
  final String title;
  final String desc;
  final String imageURL;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          imageURL,
          width: double.infinity,
          height: 300,
        ),
        Spacer(),
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30.r),
              topRight: Radius.circular(30.r),
            ),
          ),
          child: Column(
            children: [
              Text(
                title,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              Text(
                desc,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14.sp,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
