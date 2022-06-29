import 'package:flutter/material.dart';
import 'package:houses_olx/addPost/components/body.dart';
import 'package:houses_olx/addPost/components/appbar.dart';

class AddPost extends StatelessWidget {
  const AddPost({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppbar(),
      body: Body(),
    );
  }
}
