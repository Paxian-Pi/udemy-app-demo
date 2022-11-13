import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:udemy_clone/utils/constants.dart';
import 'package:udemy_clone/widgets/star_icon.dart';

class HorizontalCardLayout extends StatelessWidget {
  final String imagePath;
  final String title;
  final String tutor;
  final double rating;
  final String count;
  final String price;
  final bool isBestSeller;
  final Function onCardTap;

  const HorizontalCardLayout({
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
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 20.w,
            height: 8.h,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(imagePath),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(5.sp),
            ),
          ),
          const SizedBox(width: 15),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 60.w,
                height: 20.h,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      tutor,
                      style: TextStyle(
                        color: kTextShadowColor,
                        fontSize: 10.sp,
                      ),
                    ),
                    const SizedBox(width: 5),
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
                    const SizedBox(width: 5),
                    Text(
                      price,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 13.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Visibility(
                      visible: isBestSeller,
                      maintainSize: true,
                      maintainAnimation: true,
                      maintainState: true,
                      child: Container(
                        width: 20.w,
                        height: 3.h,
                        decoration: BoxDecoration(
                          color: const Color(0xFFECDF62),
                          borderRadius: BorderRadius.circular(3.sp),
                        ),
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
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
