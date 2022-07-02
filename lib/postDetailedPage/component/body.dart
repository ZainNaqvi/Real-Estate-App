import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Body extends StatelessWidget {
  final snap;
  Body({
    Key? key,
    required this.snap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(children: [
        Stack(
          children: [
            Container(
              height: 300.h,
              width: double.infinity,
              child: CachedNetworkImage(
                imageUrl: snap!["postURL"],
              ),
            ),
            Positioned(
              bottom: -5.h,
              right: -20.w,
              child: Container(
                width: 115.w,
                height: 115.h,
                decoration: BoxDecoration(
                    color: Colors.black38, shape: BoxShape.circle),
                child: Icon(
                  FontAwesomeIcons.thumbsUp,
                  size: 54.sp,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 16.h,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 0.0),
                    child: Container(
                      padding: const EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.r),
                          border: Border.all(color: Colors.green)),
                      child: Text(
                        'Apartment',
                        style: TextStyle(color: Colors.green),
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.star,
                        color: Colors.yellow,
                      ),
                      SizedBox(
                        width: 8.w,
                      ),
                      Text("23 Likes"),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 14.h,
              ),
              Text(
                "Owent Apartment",
                style: TextStyle(
                  fontSize: 28.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(
                height: 14.h,
              ),
              Row(
                children: [
                  Icon(
                    Icons.location_on_outlined,
                    color: Colors.green,
                  ),
                  SizedBox(
                    width: 4.w,
                  ),
                  Text("data"),
                ],
              ),
              SizedBox(
                height: 12.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  statsHouse(iconData: Icons.bed, items: "4", title: "Beds"),
                  statsHouse(
                      iconData: Icons.bathroom, items: "6", title: "Bath"),
                  statsHouse(
                      iconData: Icons.expand, items: "1,2343", title: "sqft"),
                ],
              ),
              SizedBox(
                height: 8.h,
              ),
              Divider(),
              SizedBox(
                height: 8.h,
              ),
              ListTile(
                leading: CircleAvatar(),
                title: Text("Title"),
                subtitle: Text("email of the user"),
                trailing: Icon(FontAwesomeIcons.phone),
              ),
              SizedBox(
                height: 16.h,
              ),
              Text(
                "Overview",
                style: TextStyle(
                  fontSize: 24.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(
                height: 16.h,
              ),
              Text(
                "A car is a wheeled motor vehicle used for transportation. Most definitions of cars say that they run primarily on roads, seat one to eight people, have four wheels, and mainly transport people rather than goods. Cars came into global use during the 20th century, and developed economies depend on them. Wikipedi",
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ),
      ]),
    );
  }

  Widget statsHouse({
    required IconData iconData,
    required String items,
    required String title,
  }) {
    return Row(
      children: [
        Container(
          padding: EdgeInsets.all(8.r),
          width: 44.w,
          height: 44.h,
          decoration: BoxDecoration(
            color: Colors.green.withOpacity(0.04),
            shape: BoxShape.circle,
          ),
          child: Row(
            children: [
              Icon(
                iconData,
                color: Colors.green,
              ),
            ],
          ),
        ),
        SizedBox(
          width: 8.w,
        ),
        Text("$items $title"),
      ],
    );
  }
}
