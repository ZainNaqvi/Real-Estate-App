import 'package:flutter/material.dart';

Widget splashDots({required int index, required int currentIndex}) {
  return AnimatedContainer(
    duration: Duration(milliseconds: 600),
    margin: EdgeInsets.only(right: 5),
    width: currentIndex == index ? 32 : 6,
    height: 6,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(3),
      color: currentIndex == index ? Colors.blue : Colors.grey,
    ),
  );
}
