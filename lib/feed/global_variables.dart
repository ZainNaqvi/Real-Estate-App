import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:houses_olx/addPost/addpost.dart';
import 'package:houses_olx/gallary/gallary.dart';
import 'package:houses_olx/home/home.dart';
import 'package:houses_olx/profile/profile.dart';
import 'package:houses_olx/search/search.dart';
import 'package:houses_olx/wishlist/wishlist.dart';

List<Widget> items = [
  HomeScreen(),
  SearchScreen(),
  AddPost(),
  WishListScreen(),
  ProfileScreen(),
];
