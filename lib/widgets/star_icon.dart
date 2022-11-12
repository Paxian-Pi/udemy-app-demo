import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:udemy_clone/utils/constants.dart';

class StarIcon extends StatelessWidget {
  const StarIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.star,
          color: kRatingColor,
          size: 11.sp,
        ),
        Icon(
          Icons.star,
          color: kRatingColor,
          size: 11.sp,
        ),
        Icon(
          Icons.star,
          color: kRatingColor,
          size: 11.sp,
        ),
        Icon(
          Icons.star_half,
          color: kRatingColor,
          size: 11.sp,
        ),
        Icon(
          Icons.star_border,
          color: kRatingColor,
          size: 11.sp,
        ),
      ],
    );
  }
}
