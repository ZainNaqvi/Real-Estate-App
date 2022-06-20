import 'package:flutter/material.dart';

import 'customOutlinedbutton.dart';

class SocialLinks extends StatefulWidget {
  const SocialLinks({Key? key}) : super(key: key);

  @override
  State<SocialLinks> createState() => _SocialLinksState();
}

class _SocialLinksState extends State<SocialLinks> {
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        loading
            ? Center(
                child: CircularProgressIndicator(
                  color: Colors.white,
                ),
              )
            : customOutLinedBUtton(
                press: () {},
                imageURl: "assets/icons/googleButton.svg",
              ),
        SizedBox(
          width: 17,
        ),
        customOutLinedBUtton(
          press: () {},
          imageURl: "assets/icons/fbButton.svg",
        ),
      ],
    );
  }
}
