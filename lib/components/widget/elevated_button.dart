import 'package:email_screen/components/constants/color/app_color.dart';
import 'package:flutter/material.dart';

import '../constants/text/app_string.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      child: const Text(AppString.cleanedText),
      style: ElevatedButton.styleFrom(
        primary: AppColor.elevatedButtonColor,
        shape:  RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
      ),
    );
  }
}
