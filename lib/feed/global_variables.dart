import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:houses_olx/addPost/addpost.dart';
import 'package:houses_olx/home/home.dart';
import 'package:houses_olx/profile/profile.dart';

List<Widget> items = [
  HomeScreen(),
  Center(child: Text("WELCOME TO THE SEARCH SCREEN")),
  AddPost(),
  Center(child: Text("WELCOME TO THE NOTIFICATION SCREEEN")),
  ProfileScreen(),
];
