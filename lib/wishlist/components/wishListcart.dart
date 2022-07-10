import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class WishCart extends StatefulWidget {
  final snap;
  const WishCart({Key? key, required this.snap}) : super(key: key);

  @override
  State<WishCart> createState() => _WishCartState();
}

class _WishCartState extends State<WishCart> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Card(
                clipBehavior: Clip.antiAlias,
                elevation: 2.0,
                color: Colors.grey.withOpacity(0.1),
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 12.0.h),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.black,
                      backgroundImage: NetworkImage(
                        widget.snap['postPic'],
                      ),
                    ),
                    title: Padding(
                      padding: const EdgeInsets.only(bottom: 6.0),
                      child: Row(
                        children: [
                          Text(
                            "${widget.snap['postTitle']}",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 12.h,
                            ),
                          ),
                        ],
                      ),
                    ),
                    trailing: Column(
                      children: [
                        Container(
                          width: 40.w,
                          height: 20.h,
                          decoration: BoxDecoration(
                              color: Colors.green,
                              borderRadius: BorderRadius.circular(2.r)),
                          child: Text(
                            "Buy",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w700),
                          ),
                        ),
                        Text(
                          DateFormat.yMMMd().format(
                            widget.snap["datePublished"].toDate(),
                          ),
                          style: TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                    subtitle: Column(
                      children: [
                        Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            "${widget.snap['postLocation']}",
                            style: TextStyle(
                              fontSize: 15.sp,
                            ),
                            textAlign: TextAlign.justify,
                          ),
                        ),
                        SizedBox(height: 5.h),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            "${widget.snap['postPrice']} Price",
                            style: TextStyle(
                              fontSize: 16.sp,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.justify,
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
