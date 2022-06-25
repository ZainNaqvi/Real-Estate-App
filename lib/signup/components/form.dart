import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../widget/customOutlineBorder.dart';
import '../../widget/customTextFormLable.dart';
import '../../widget/default.dart';
import '../../widget/dropdown.dart';
import '../../widget/inputDecoration.dart';

import '../../widget/validator.dart';

class FormFields extends StatefulWidget {
  const FormFields({Key? key}) : super(key: key);

  @override
  State<FormFields> createState() => _FormFieldsState();
}

class _FormFieldsState extends State<FormFields> {
  TextEditingController _userEmailController = TextEditingController();
  TextEditingController _userPasswordController = TextEditingController();
  TextEditingController _userFirstNameController = TextEditingController();
  TextEditingController _userLastNameController = TextEditingController();
  TextEditingController _userConfirmPasswordController =
      TextEditingController();
  TextEditingController _userPhoneNumberController = TextEditingController();
  TextEditingController _userAddressController = TextEditingController();
  TextEditingController _userCNICController = TextEditingController();
  bool isObscure = true;
  bool isCObscure = true;
  bool isChecked = true;
  @override
  void dispose() {
    super.dispose();
    _userEmailController.dispose();
    _userPasswordController.dispose();
    _userFirstNameController.dispose();
    _userLastNameController.dispose();
    _userConfirmPasswordController.dispose();
    _userPhoneNumberController.dispose();
    _userAddressController.dispose();
    _userCNICController.dispose();
  }

  final _formKey = GlobalKey<FormState>();
  dynamic _genderMale = "male";
  double _age = 0;

  var countries = ["Pakistan", "India", "China", "Afghanistan", "others"];
  Object? selectedCountry = "Pakistan";
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
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
          customTextFieldLable(
            lableText: "Email",
            isRequired: true,
          ),
          SizedBox(
            height: 8.h,
          ),
          TextFormField(
            controller: _userEmailController,
            validator: emailValidator,
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.next,
            decoration: customInputDecoration(
              suffixIcon: null,
              hintText: "Email",
              press: () {},
            ),
          ),
          SizedBox(
            height: 8.h,
          ),
          customTextFieldLable(isRequired: true, lableText: "Password"),
          SizedBox(
            height: 8.h,
          ),
          TextFormField(
            controller: _userPasswordController,
            validator: passwordValidator,
            keyboardType: TextInputType.visiblePassword,
            textInputAction: TextInputAction.next,
            obscureText: isObscure,
            decoration: customInputDecoration(
                suffixIcon: Icons.remove_red_eye,
                hintText: "Password",
                press: () {
                  setState(() {
                    isObscure = !isObscure;
                  });
                }),
          ),
          SizedBox(
            height: 8.h,
          ),
          SizedBox(
            height: 8.h,
          ),
          customTextFieldLable(isRequired: true, lableText: "Confirm Password"),
          SizedBox(
            height: 8.h,
          ),
          TextFormField(
            controller: _userConfirmPasswordController,
            validator: passwordValidator,
            keyboardType: TextInputType.visiblePassword,
            textInputAction: TextInputAction.next,
            obscureText: isCObscure,
            decoration: customInputDecoration(
                suffixIcon: Icons.remove_red_eye,
                hintText: "Password",
                press: () {
                  setState(() {
                    isCObscure = !isCObscure;
                  });
                }),
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
                  child: Row(
                    children: <Widget>[
                      Text(category),
                    ],
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
            height: 8.h,
          ),
          Row(
            children: [
              Checkbox(
                value: isChecked,
                onChanged: (value) {
                  setState(() {
                    isChecked = !isChecked;
                  });
                },
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.r),
                ),
                side: BorderSide(
                  color: Colors.blue,
                ),
              ),
              SizedBox(
                width: 8.w,
              ),
              Text(
                "Remember me",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 8.h,
          ),
          defaultButton(
              text: "Sign up",
              press: () {
                if (!_formKey.currentState!.validate()) {
                  // If the form is not valid, display a snackbar. In the real world,

                } else {
                  // If the form is valid, display a snackbar. In the real world,
                  // you'd often call a server or save the information in a database.

                }
              }),
        ],
      ),
    );
  }
}
