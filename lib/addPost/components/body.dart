import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:houses_olx/widget/default.dart';
import 'package:houses_olx/widget/imagepicker.dart';
import 'package:houses_olx/widget/validator.dart';
import 'package:image_picker/image_picker.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  TextEditingController _userTitleController = TextEditingController();
  TextEditingController _userLocationController = TextEditingController();
  TextEditingController _userOverViewController = TextEditingController();
  TextEditingController _userPriceController = TextEditingController();
  TextEditingController _userBedsController = TextEditingController();
  TextEditingController _userRoomsController = TextEditingController();
  TextEditingController _userSQrtController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  void dispose() {
    super.dispose();
    _userBedsController.dispose();
    _userRoomsController.dispose();
    _userLocationController.dispose();
    _userOverViewController.dispose();
    _userPriceController.dispose();
    _userSQrtController.dispose();
    _userTitleController.dispose();
  }

  double priceRangeValue = 0;
  RangeValues _currentRangeValues = const RangeValues(0, 100000);

  Uint8List? _file;
  submitForm() {}
  @override
  Widget build(BuildContext context) {
    print(priceRangeValue);
    print(_file);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0.w),
      child: SingleChildScrollView(
          child: Column(
        children: [
          Stack(
            children: [
              Container(
                  clipBehavior: Clip.antiAlias,
                  width: double.infinity,
                  height: 150.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  child: _file == null
                      ? Image.asset(
                          "assets/images/eral.jpg",
                          fit: BoxFit.cover,
                        )
                      : CircleAvatar(
                          key: UniqueKey(),
                          backgroundImage: MemoryImage(
                            _file!,
                          ),
                          backgroundColor: Colors.white.withOpacity(0.13),
                          radius: 50,
                        )),
              InkWell(
                onTap: () async {
                  Uint8List file = await pickImage(ImageSource.gallery);
                  setState(() {
                    _file = file;
                  });
                },
                child: Center(
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: 28.h),
                    width: 90.w,
                    height: 90.h,
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.4),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.camera,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Form(
            key: _formKey,
            child: Column(
              children: [
                SizedBox(
                  height: 8.h,
                ),
                TextFormField(
                  validator: requiredField,
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.text,
                  controller: _userTitleController,
                  decoration: InputDecoration(hintText: "Title"),
                ),
                SizedBox(
                  height: 8.h,
                ),
                TextFormField(
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.text,
                  validator: requiredField,
                  controller: _userLocationController,
                  decoration: InputDecoration(hintText: "Location"),
                ),
                SizedBox(
                  height: 8.h,
                ),
                TextFormField(
                  validator: requiredField,
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.text,
                  controller: _userOverViewController,

                  maxLines: 8, //or null
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        gapPadding: 4,
                        borderSide: BorderSide(
                          color: Colors.grey,
                          width: 3,
                        ),
                      ),
                      hintText: "Enter your overview here"),
                ),
                SizedBox(
                  height: 16.h,
                ),

                // RangeSlider(
                //   values: _currentRangeValues,
                //   min: 0,
                //   max: 100000,
                //   divisions: 100,
                //   labels: RangeLabels(
                //     _currentRangeValues.start.round().toString(),
                //     _currentRangeValues.end.round().toString(),
                //   ),
                //   onChanged: (RangeValues values) {
                //     setState(() {
                //       _currentRangeValues = values;
                //     });
                //   },
                // )

                TextFormField(
                  textInputAction: TextInputAction.next,
                  validator: requiredField,
                  controller: _userPriceController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(hintText: "Price"),
                ),
                SizedBox(
                  height: 8.h,
                ),
                TextFormField(
                  validator: requiredField,
                  textInputAction: TextInputAction.next,
                  controller: _userBedsController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(hintText: "Beds"),
                ),
                SizedBox(
                  height: 8.h,
                ),
                TextFormField(
                  validator: requiredField,
                  textInputAction: TextInputAction.next,
                  controller: _userRoomsController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(hintText: "Room"),
                ),
                SizedBox(
                  height: 8.h,
                ),
                TextFormField(
                  validator: requiredField,
                  textInputAction: TextInputAction.next,
                  controller: _userSQrtController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(hintText: "Sqft"),
                ),
                SizedBox(
                  height: 16.h,
                ),
                defaultButton(
                    text: "Send",
                    press: () {
                      if (!_formKey.currentState!.validate()) {
                        // If the form is not valid, display a snackbar. In the real world,

                      } else {
                        submitForm();
                      }
                    }),
                SizedBox(
                  height: 16.h,
                ),
              ],
            ),
          ),
        ],
      )),
    );
  }
}