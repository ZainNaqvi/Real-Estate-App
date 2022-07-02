import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:houses_olx/models/users.dart';
import 'package:houses_olx/signin/signin.dart';
import 'package:provider/provider.dart';

import '../../db/authentication/firebase_auth_methods.dart';
import '../../provider/userProviders.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    UserCreaditials userCreaditials =
        Provider.of<UserProviders>(context).getUser;
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
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
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Container(
                    width: 34.w,
                    height: 44.h,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4.r),
                        color: Colors.green.withOpacity(0.04)),
                    child: Icon(
                      Icons.settings,
                      color: Colors.green,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 24.h,
              ),
              Row(
                children: [
                  Stack(
                    clipBehavior: Clip.none,
                    children: [
                      CircleAvatar(
                        radius: 50,
                        backgroundImage:
                            NetworkImage(userCreaditials.profilePic),
                      ),
                      Positioned(
                        bottom: 0,
                        right: -5.w,
                        child: Column(
                          children: [
                            Container(
                              width: 44.w,
                              height: 44.h,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.black38,
                              ),
                              child: Icon(
                                Icons.edit,
                                color: Colors.green,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 24.w,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        userCreaditials.fullname,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16.sp,
                          fontFamily: "arial",
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(
                        height: 8.h,
                      ),
                      Text(userCreaditials.email),
                      SizedBox(
                        height: 8.h,
                      ),
                      Text(userCreaditials.country),
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
              customListTIle(
                press: () {},
                leading: Icons.person,
                text: "Edit Profile",
                trailing: Icons.arrow_forward_ios_outlined,
              ),
              Divider(),
              customListTIle(
                press: () {},
                leading: Icons.remove_red_eye,
                text: "Appearance",
                trailing: Icons.arrow_forward_ios_outlined,
              ),
              Divider(),
              customListTIle(
                press: () {},
                leading: Icons.person,
                text: "Invite Friend",
                trailing: Icons.arrow_forward_ios_outlined,
              ),
              Divider(),
              customListTIle(
                press: () {
                  FirebaseAuthMethods().signOut();
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (context) => Signin(),
                    ),
                  );
                },
                leading: Icons.logout,
                text: "Logout",
                trailing: null,
              ),
              Divider(),
            ],
          ),
        ),
      ),
    );
  }

  Widget customListTIle({
    required IconData leading,
    required String text,
    required IconData? trailing,
    required VoidCallback press,
  }) {
    return InkWell(
      onTap: press,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 14.h),
        child: ListTile(
          leading: Container(
            width: 54.w,
            height: 54.h,
            decoration: BoxDecoration(
              color: text == "Logout"
                  ? Colors.red[200]
                  : Colors.green.withOpacity(0.04),
              shape: BoxShape.circle,
            ),
            child: Icon(
              leading,
              color: text == "Logout" ? Colors.white : Colors.green,
            ),
          ),
          title: Text(
            text,
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w600,
              fontSize: 16.sp,
            ),
          ),
          trailing: Icon(
            trailing,
            color: Colors.green,
          ),
        ),
      ),
    );
  }
}
