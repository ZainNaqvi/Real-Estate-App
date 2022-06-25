import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:houses_olx/db/authentication/firebase_auth_methods.dart';
import 'package:houses_olx/feed/feedScreen.dart';
import 'package:houses_olx/widget/customSnakeBar.dart';

import '../../widget/customTextFormLable.dart';
import '../../widget/default.dart';
import '../../widget/inputDecoration.dart';
import '../../widget/validator.dart';

class form extends StatefulWidget {
  const form({
    Key? key,
  }) : super(key: key);

  @override
  State<form> createState() => _formState();
}

class _formState extends State<form> {
  TextEditingController _userFirstNameController = TextEditingController();
  TextEditingController _userLastNameController = TextEditingController();

  TextEditingController _userPhoneNumberController = TextEditingController();
  TextEditingController _userAddressController = TextEditingController();
  TextEditingController _userCNICController = TextEditingController();
  @override
  void dispose() {
    super.dispose();

    _userFirstNameController.dispose();
    _userLastNameController.dispose();

    _userPhoneNumberController.dispose();
    _userAddressController.dispose();
    _userCNICController.dispose();
  }

  final _formKey = GlobalKey<FormState>();
  dynamic _genderMale = "male";
  double _age = 0;

  var countries = ["Pakistan", "India", "China", "Afghanistan", "others"];
  Object? selectedCountry = "Pakistan";
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    submitForm() async {
      setState(() {
        isLoading = true;
      });
      String res = await FirebaseAuthMethods().completeProfile(
        firstName: _userFirstNameController.text,
        lastName: _userLastNameController.text,
        phoneNumber: _userPhoneNumberController.text,
        address: _userAddressController.text,
        cnic: _userCNICController.text,
        country: selectedCountry.toString(),
        age: _age.toString(),
        gender: _genderMale,
        context: context,
      );
      if (res == 'success') {
        setState(() {
          isLoading = false;
        });
        showSnakeBar("Saved Successfully.", context);
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => FeedScreen(),
          ),
        );
      }
    }

    return Form(
      key: _formKey,
      child: Column(
        children: [
          customTextFieldLable(
            isRequired: true,
            lableText: "First Name",
          ),
          SizedBox(
            height: 8.h,
          ),
          TextFormField(
            controller: _userFirstNameController,
            validator: requiredField,
            keyboardType: TextInputType.text,
            textInputAction: TextInputAction.next,
            decoration: customInputDecoration(
              suffixIcon: null,
              hintText: "First Name",
              press: () {},
            ),
          ),
          SizedBox(
            height: 8.h,
          ),
          customTextFieldLable(
            isRequired: true,
            lableText: "Last Name",
          ),
          SizedBox(
            height: 8.h,
          ),
          TextFormField(
            controller: _userLastNameController,
            validator: requiredField,
            keyboardType: TextInputType.text,
            textInputAction: TextInputAction.next,
            decoration: customInputDecoration(
              suffixIcon: null,
              hintText: "Last Name",
              press: () {},
            ),
          ),
          SizedBox(
            height: 8.h,
          ),
          SizedBox(
            height: 8.h,
          ),
          customTextFieldLable(isRequired: true, lableText: "Phone Number"),
          SizedBox(
            height: 8.h,
          ),
          TextFormField(
            controller: _userPhoneNumberController,
            validator: numberValidator,
            keyboardType: TextInputType.number,
            textInputAction: TextInputAction.next,
            decoration: customInputDecoration(
              suffixIcon: null,
              hintText: "Phone Number",
              press: () {},
            ),
          ),
          SizedBox(
            height: 8.h,
          ),
          customTextFieldLable(
            isRequired: true,
            lableText: "Address",
          ),
          SizedBox(
            height: 8.h,
          ),
          TextFormField(
            controller: _userAddressController,
            validator: requiredField,
            keyboardType: TextInputType.text,
            textInputAction: TextInputAction.next,
            decoration: customInputDecoration(
              suffixIcon: null,
              hintText: "Address",
              press: () {},
            ),
          ),
          SizedBox(
            height: 8.h,
          ),
          customTextFieldLable(
            isRequired: true,
            lableText: "C N I C",
          ),
          SizedBox(
            height: 8.h,
          ),
          TextFormField(
            controller: _userCNICController,
            validator: cnicValidator,
            keyboardType: TextInputType.number,
            textInputAction: TextInputAction.next,
            decoration: customInputDecoration(
              suffixIcon: null,
              hintText: "*****-*******-*",
              press: () {},
            ),
          ),
          SizedBox(
            height: 8.h,
          ),
          customTextFieldLable(
            lableText: "Country",
            isRequired: true,
          ),
          SizedBox(
            height: 8.h,
          ),
          DropdownButtonFormField(
            items: countries.map((String category) {
              return DropdownMenuItem(
                  value: category,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.0.w),
                    child: Row(
                      children: <Widget>[
                        Text(category),
                      ],
                    ),
                  ));
            }).toList(),
            onChanged: (newValue) {
              // do other stuff with _category
              setState(() => selectedCountry = newValue);
            },
            value: selectedCountry,
            decoration: customInputDecoration(
              suffixIcon: Icons.person,
              hintText: "",
              press: () {},
            ),
          ),
          SizedBox(
            height: 8.h,
          ),
          customTextFieldLable(
            isRequired: true,
            lableText: "Age",
          ),
          Slider(
            value: _age,
            min: 0.0,
            max: 100.0,
            divisions: 100,
            label: '${_age.round()}',
            onChanged: (double value) {
              setState(() {
                _age = value;
              });
            },
          ),
          SizedBox(
            height: 8.h,
          ),
          customTextFieldLable(lableText: "Gender", isRequired: true),
          SizedBox(
            height: 8.h,
          ),
          Row(
            children: [
              Radio(
                autofocus: true,
                value: "male",
                groupValue: _genderMale,
                onChanged: (value) {
                  setState(() {
                    _genderMale = value!;
                  });
                },
              ),
              SizedBox(
                width: 3.w,
              ),
              Text(
                "Male",
              ),
              SizedBox(
                width: 8.h,
              ),
              Radio(
                value: "Female",
                groupValue: _genderMale,
                onChanged: (value) {
                  setState(() {
                    _genderMale = value!;
                  });
                },
              ),
              SizedBox(
                width: 3.h,
              ),
              Text("Female"),
            ],
          ),
          SizedBox(
            height: 16.h,
          ),
          isLoading
              ? Center(
                  child: CircularProgressIndicator(color: Colors.green[900]),
                )
              : defaultButton(
                  text: "Save",
                  press: () {
                    if (!_formKey.currentState!.validate()) {
                      // If the form is not valid, display a snackbar. In the real world,

                    } else {
                      // If the form is valid, display a snackbar. In the real world,
                      // you'd often call a server or save the information in a database.
                      submitForm();
                    }
                  }),
        ],
      ),
    );
  }
}
