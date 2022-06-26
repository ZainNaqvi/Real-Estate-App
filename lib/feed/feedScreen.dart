import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:houses_olx/feed/global_variables.dart';

class FeedScreen extends StatefulWidget {
  static String routeName = "/feedScreen";

  @override
  State<FeedScreen> createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    pageController = PageController();
  }

  // creating the page controlller
  late PageController pageController;

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }

  int _page = 0;
  selectedTab(int selectedPage) {
    pageController.jumpToPage(selectedPage);
  }

  onPageChanged(int page) {
    setState(() {
      _page = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        children: items,
        physics: NeverScrollableScrollPhysics(),
        controller: pageController,
        onPageChanged: onPageChanged,
      ),
      bottomNavigationBar: CupertinoTabBar(
        height: 70.sp,
        backgroundColor: Colors.white,
        items: [
          BottomNavigationBarItem(
            icon: Container(
              width: 44.w,
              height: 36.h,
              decoration: BoxDecoration(
                  color:
                      _page == 0 ? Colors.blue : Colors.black.withOpacity(0.04),
                  borderRadius: BorderRadius.circular(10.r)),
              child: Icon(
                Icons.home,
                size: _page == 0 ? 35 : 30,
                color: _page == 0 ? Colors.white : Colors.grey,
              ),
            ),
            label: "",
            backgroundColor: Colors.white,
          ),
          BottomNavigationBarItem(
            icon: Container(
              width: 44.w,
              height: 36.h,
              decoration: BoxDecoration(
                  color:
                      _page == 1 ? Colors.blue : Colors.black.withOpacity(0.04),
                  borderRadius: BorderRadius.circular(10.r)),
              child: Icon(
                Icons.search,
                size: _page == 1 ? 35 : 30,
                color: _page == 1 ? Colors.white : Colors.grey,
              ),
            ),
            label: "",
            backgroundColor: Colors.white,
          ),
          BottomNavigationBarItem(
            icon: Container(
              width: 44.w,
              height: 36.h,
              decoration: BoxDecoration(
                  color:
                      _page == 2 ? Colors.blue : Colors.black.withOpacity(0.04),
                  borderRadius: BorderRadius.circular(10.r)),
              child: Icon(
                Icons.favorite_outline,
                size: _page == 2 ? 35 : 30,
                color: _page == 2 ? Colors.white : Colors.grey,
              ),
            ),
            label: "",
            backgroundColor: Colors.white,
          ),
          BottomNavigationBarItem(
            icon: Container(
              width: 44.w,
              height: 36.h,
              decoration: BoxDecoration(
                  color:
                      _page == 3 ? Colors.blue : Colors.black.withOpacity(0.04),
                  borderRadius: BorderRadius.circular(10.r)),
              child: Icon(
                Icons.messenger_outline,
                size: _page == 3 ? 35 : 30,
                color: _page == 3 ? Colors.white : Colors.grey,
              ),
            ),
            label: "",
            backgroundColor: Colors.white,
          ),
          BottomNavigationBarItem(
            icon: Container(
              width: 44.w,
              height: 36.h,
              decoration: BoxDecoration(
                  color:
                      _page == 4 ? Colors.blue : Colors.black.withOpacity(0.04),
                  borderRadius: BorderRadius.circular(10.r)),
              child: Icon(
                Icons.person,
                size: _page == 4 ? 35 : 30,
                color: _page == 4 ? Colors.white : Colors.grey,
              ),
            ),
            label: "",
            backgroundColor: Colors.white,
          ),
        ],
        onTap: selectedTab,
      ),
    );
  }
}
