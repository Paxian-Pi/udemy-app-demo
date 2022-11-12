import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

const imagePath = 'assets/img-main.jpg';
const star = 'assets/star.png';
const star2 = 'assets/star2.png';
const search = 'assets/search.png';
const search2 = 'assets/search2.png';
const play = 'assets/play.png';
const play2 = 'assets/play2.png';
const favourite = 'assets/favourite.png';
const favourite2 = 'assets/favourite2.png';
const profile = 'assets/profile.png';
const profile2 = 'assets/profile2.png';

const kPrimaryColor = Color(0xFFF8F5F5);
const kTextShadowColor = Color(0x4D000000);
const kRatingColor = Color.fromARGB(255, 209, 128, 8);
const kInactiveButtonColor = Color(0xFF474747);

final kTextShadow = [
  Shadow(offset: Offset(0, 0.1.h), blurRadius: 6.0.sp, color: kTextShadowColor),
];

final kBoxShadow = [
  BoxShadow(
    color: kPrimaryColor,
    spreadRadius: 5,
    blurRadius: 30.sp,
    offset: const Offset(0, 3),
  ),
];
