import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:theek_karo/utils/appcolors.dart';

class CustomButton extends StatelessWidget {
  VoidCallback btnAction;
  var btnText;
  CustomButton({required this.btnAction, this.btnText});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Get.width * 0.4,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          elevation: 0,
          minimumSize: const Size.fromHeight(40),
          primary: AppColors.deepOrange,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(Get.width * 0.024),
          ),
        ),
        onPressed: btnAction,
        child: Text(
          btnText,
          style: TextStyle(color: AppColors.white),
        ),
      ),
    );
  }
}
