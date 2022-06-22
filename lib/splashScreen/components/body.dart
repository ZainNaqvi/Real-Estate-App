import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:houses_olx/signup/signup.dart';
import 'package:houses_olx/splashScreen/components/splashstats.dart';
import 'package:houses_olx/splashScreen/components/splastDots.dart';

import '../../widget/default.dart';

class Body extends StatefulWidget {
  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  int currentIndex = 0;

  List<Map<String, String>> items = [
    {
      "title": "The Biggest Real Estate App\nof the Century",
      "desc":
          "the e-Commerce industry is witnessing the most significant growth of mobile solutions development.",
      "imageURL": "assets/images/house1.jpg",
    },
    {
      "title": "We Focus on Providing a\nComfortable Place for You",
      "desc":
          "the e-Commerce industry is witnessing the most significant growth of mobile solutions development.",
      "imageURL": "assets/images/house2.jpg",
    },
    {
      "title": "Find your Beloved Family's Dream\nHouse with us",
      "desc":
          "the e-Commerce industry is witnessing the most significant growth of mobile solutions development.",
      "imageURL": "assets/images/house1.jpg",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            SizedBox(
              height: 40.h,
            ),
            Expanded(
              flex: 3,
              child: PageView.builder(
                onPageChanged: (value) {
                  setState(() {
                    currentIndex = value;
                  });
                },
                itemCount: items.length,
                itemBuilder: (context, index) => splashStats(
                  title: items[index]["title"].toString(),
                  desc: items[index]["desc"].toString(),
                  imageURL: items[index]["imageURL"].toString(),
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                color: Colors.white,
                child: Column(
                  children: [
                    Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        items.length,
                        (index) => splashDots(
                            index: index, currentIndex: currentIndex),
                      ),
                    ),
                    Spacer(
                      flex: 3,
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context)
                            .pushReplacementNamed(SignUp.routeName);
                      },
                      child: Text(
                        "Skip",
                        style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.w500,
                          fontSize: 16.sp,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 20.w),
                      child: currentIndex == 2
                          ? defaultButton(
                              press: () {
                                Navigator.of(context)
                                    .pushReplacementNamed(SignUp.routeName);
                              },
                              text: "Continue")
                          : defaultButton(press: () {}, text: "Continue"),
                    ),
                    Spacer(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
