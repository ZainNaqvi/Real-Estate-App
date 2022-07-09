import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geolocator/geolocator.dart';
import 'package:houses_olx/home/components/header.dart';
import 'package:houses_olx/home/components/menuHouses.dart';
import 'package:houses_olx/home/components/productHeading.dart';
import 'package:houses_olx/house/house.dart';

import 'package:provider/provider.dart';

import '../../provider/userProviders.dart';
import '../../widget/customCard.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  void initState() {
    addData();
    // _getCurrentLocation();
    super.initState();
  }

  addData() async {
    UserProviders userProviders = Provider.of(context, listen: false);

    await userProviders.refreshUser();
  }

  // Position? _currentPosition;
  // String? _currentAddress;
  // final Geolocator geolocator = Geolocator()..forceAndroidLocationManager;
  // _getCurrentLocation() {
  //   geolocator
  //       .getCurrentPosition(desiredAccuracy: LocationAccuracy.best)
  //       .then((Position position) {
  //     setState(() {
  //       _currentPosition = position;
  //     });

  //     _getAddressFromLatLng();
  //   }).catchError((e) {
  //     print(e);
  //   });
  // }

  // _getAddressFromLatLng() async {
  //   try {
  //     List<Placemark> p = await geolocator.placemarkFromCoordinates(
  //         _currentPosition!.latitude, _currentPosition!.longitude);

  //     Placemark place = p[0];

  //     setState(() {
  //       _currentAddress =
  //           "${place.locality} ${place.postalCode}, ${place.country}";
  //     });
  //     print(_currentAddress);
  //     print(_currentPosition);
  //   } catch (e) {
  //     print(e);
  //   }
  // }
  List images = [
    "https://source.unsplash.com/user/c_v_r",
    "https://picsum.photos/200/300",
    "https://picsum.photos/200",
    "https://picsum.photos/200/300?random=2",
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: UserProviders().isLoading
          ? Center(child: CupertinoActivityIndicator())
          : Padding(
              padding: EdgeInsets.only(left: 16.0.w, right: 16.0.w, top: 16.h),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    // header(_currentAddress!),
                    header(),
                    SizedBox(
                      height: 16.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width - 100,
                          // height: 50,
                          decoration: BoxDecoration(
                            color: Colors.grey.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: TextField(
                            decoration: InputDecoration(
                                enabledBorder: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                border: InputBorder.none,
                                hintText: "Search",
                                suffixIcon: Icon(
                                  Icons.search,
                                  color: Colors.grey,
                                ),
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 15)),
                          ),
                        ),
                        Container(
                          width: 44.w,
                          height: 44.h,
                          decoration: BoxDecoration(
                              color: Colors.green.withOpacity(
                                0.04,
                              ),
                              borderRadius: BorderRadius.circular(10.r)),
                          child:
                              Icon(Icons.line_weight, color: Color(0xff023020)),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Row(
                      children: [
                        SizedBox(width: 1.w),
                        menuButton(
                          iconData: Icons.house,
                          text: "House",
                          press: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => HouseScreen(
                                  pageInfo: "House",
                                ),
                              ),
                            );
                          },
                        ),
                        SizedBox(
                          width: 7.w,
                        ),
                        menuButton(
                          iconData: Icons.villa,
                          text: "Villa",
                          press: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => HouseScreen(
                                      pageInfo: "Villa",
                                    )));
                          },
                        ),
                        SizedBox(
                          width: 7.w,
                        ),
                        menuButton(
                          iconData: Icons.apartment,
                          text: "Apartment",
                          press: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => HouseScreen(
                                  pageInfo: "Apartment",
                                ),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 16.h,
                    ),
                    CarouselSlider(
                      options: CarouselOptions(
                          height: 100,
                          aspectRatio: 16 / 9,
                          viewportFraction: 0.8,
                          initialPage: 0,
                          enableInfiniteScroll: true,
                          reverse: false,
                          autoPlay: true,
                          autoPlayInterval: Duration(seconds: 3),
                          autoPlayAnimationDuration:
                              Duration(milliseconds: 800),
                          autoPlayCurve: Curves.fastOutSlowIn,
                          enlargeCenterPage: true,
                          scrollDirection: Axis.horizontal),
                      items: [
                        1,
                        2,
                        3,
                      ].map((i) {
                        return Builder(builder: (BuildContext context) {
                          return Container(
                              width: MediaQuery.of(context).size.width,
                              margin: EdgeInsets.symmetric(horizontal: 5.0),
                              decoration: BoxDecoration(
                                  color: Colors.teal,
                                  borderRadius: BorderRadius.circular(10.r)),
                              child: Stack(children: [
                                Container(
                                  decoration: BoxDecoration(
                                      color: Colors.teal,
                                      borderRadius:
                                          BorderRadius.circular(10.r)),
                                  width: MediaQuery.of(context).size.width,
                                  child: CachedNetworkImage(
                                    width: dou,
                                    fit: BoxFit.contain,
                                    imageUrl: images[i],
                                    placeholder: (context, url) =>
                                        CupertinoActivityIndicator(),
                                    errorWidget: (context, url, error) =>
                                        Icon(Icons.error),
                                  ),
                                ),
                                Positioned(
                                  top: 10,
                                  left: 10,
                                  child: Text(
                                    "Adds ${i}",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 22.sp,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ]));
                        });
                      }).toList(),
                    ),
                    SizedBox(
                      height: 16.h,
                    ),
                    productHeading(
                      press: () {},
                      text: "See all",
                      title: "Popular",
                    ),
                    SizedBox(
                      height: 16.h,
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          customCard(),
                          customCard(),
                          customCard(),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 16.h,
                    ),
                    productHeading(
                      press: () {},
                      text: "See all",
                      title: "Nearby Your Location",
                    ),
                    SizedBox(
                      height: 16.h,
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          customCard(),
                          customCard(),
                          customCard(),
                          customCard(),
                          customCard(),
                          customCard(),
                          customCard(),
                          customCard(),
                          customCard(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
