import 'package:flutter/material.dart';

Padding suffixicon({required IconData icon}) {
  return Padding(
    padding: const EdgeInsets.fromLTRB(0, 3, 20, 3),
    child: Icon(
      icon,
      size: 30,
    ),
  );
}
