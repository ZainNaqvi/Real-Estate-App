import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 16.w, right: 16.w, top: 8.h),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Settings",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 26.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Container(
                width: 30.w,
                height: 40.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4.r),
                  color: Colors.greenAccent,
                ),
                child: Icon(
                  Icons.settings,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 24.h,
          ),
          Row(
            children: [
              CircleAvatar(
                radius: 50,
              ),
              SizedBox(
                width: 24.w,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Zain Haider Naqvi",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18.sp,
                      fontFamily: "arial",
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(
                    height: 8.h,
                  ),
                  Text("The Fluter Devolper"),
                  SizedBox(
                    height: 8.h,
                  ),
                  Text("Zain Haider"),
                ],
              ),
            ],
          ),
          SizedBox(
            height: 16.h,
          ),
          Divider(),
          SizedBox(
            height: 24.h,
          ),
          ListTile(
            leading: Container(
              width: 54.w,
              height: 54.h,
              decoration: BoxDecoration(
                color: Colors.greenAccent,
                shape: BoxShape.circle,
              ),
              child: Icon(Icons.person),
            ),
            title: Text(
              "Edit Profile",
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                  fontSize: 18.sp),
            ),
            trailing: Icon(
              Icons.arrow_forward_ios_outlined,
              color: Colors.green,
            ),
          ),
        ],
      ),
    );
  }
}
