import 'package:flutter/material.dart';

Column paidstats() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        "Total:",
        style: TextStyle(color: Colors.grey),
      ),
      SizedBox(
        height: 5,
      ),
      Text(
        "\$337.15:",
        style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
      ),
    ],
  );
}
