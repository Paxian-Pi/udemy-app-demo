import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:udemy_clone/utils/constants.dart';
import 'package:udemy_clone/widgets/star_icon.dart';

class CustomCard extends StatelessWidget {
  final String imagePath;
  final String title;
  final String tutor;
  final double rating;
  final String count;
  final String price;
  final bool isBestSeller;
  final Function onCardTap;

  const CustomCard({
    Key? key,
    required this.imagePath,
    required this.title,
    required this.tutor,
    required this.rating,
    required this.count,
    required this.price,
    required this.isBestSeller,
    required this.onCardTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onCardTap(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 60.w,
            height: 18.h,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(imagePath),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(10.sp),
            ),
          ),
          const SizedBox(height: 10),
          SizedBox(
            width: 60.w,
            height: 17.h,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  tutor,
                  style: TextStyle(
                    color: kTextShadowColor,
                    fontSize: 10.sp,
                  ),
                ),
                const SizedBox(height: 5),
                Row(
                  children: [
                    Text(
                      '$rating',
                      style: TextStyle(
                          color: kRatingColor,
                          fontSize: 10.sp,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(width: 5),
                    const StarIcon(),
                    const SizedBox(width: 5),
                    Text(
                      count,
                      style: TextStyle(
                          color: Colors.grey.shade700, fontSize: 10.sp),
                    ),
                  ],
                ),
                const SizedBox(height: 5),
                Text(
                  price,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 13.sp,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          Visibility(
            visible: isBestSeller,
            maintainSize: true,
            maintainAnimation: true,
            maintainState: true,
            child: Container(
              decoration: BoxDecoration(
                color: const Color(0xFFECDF62),
                borderRadius: BorderRadius.circular(3.sp),
              ),
              child: Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: 2.0.w, vertical: 0.2.h),
                child: Center(
                  child: Text(
                    'Best Seller',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 9.sp,
                      shadows: kTextShadow,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
