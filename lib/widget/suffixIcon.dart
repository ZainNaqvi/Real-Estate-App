import 'package:flutter/material.dart';

Padding suffixicon({required IconData icon}) {
  return Padding(
    padding: const EdgeInsets.fromLTRB(0, 20, 20, 20),
    child: Icon(
      icon,
      size: 30,
    ),
  );
}
