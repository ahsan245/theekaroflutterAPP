import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:theek_karo/utils/appcolors.dart';

typedef void RatingChangeCallback(double rating);

class StarRating extends StatelessWidget {
  final int starCount;
  final double rating;
  final Color color;

  StarRating({this.starCount = 5, this.rating = .0, required this.color});

  Widget buildStar(BuildContext context, int index) {
    Icon icon;
    if (index >= rating) {
      icon = Icon(
        Icons.star_border,
        color: AppColors.placeHolder,
        size: Get.height * 0.02,
      );
    } else if (index > rating - 1 && index < rating) {
      icon = Icon(
        Icons.star_half,
        size: Get.height * 0.02,
        color: color ?? AppColors.placeHolder,
      );
    } else {
      icon = Icon(
        Icons.star,
        size: Get.height * 0.02,
        color: color ?? AppColors.placeHolder,
      );
    }
    return InkResponse(
      // onTap:
      //     onRatingChanged == null ? null : () => onRatingChanged(index + 1.0),
      child: icon,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
        children:
            List.generate(starCount, (index) => buildStar(context, index)));
  }
}
