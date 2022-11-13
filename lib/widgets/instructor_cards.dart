import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sizer/sizer.dart';
import 'package:udemy_clone/utils/constants.dart';
import 'package:udemy_clone/widgets/star_icon.dart';

class InstructorCards extends StatelessWidget {
  final String imagePath;
  final String title;

  const InstructorCards({
    Key? key,
    required this.imagePath,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        HapticFeedback.vibrate();
        SystemSound.play(SystemSoundType.click);
      },
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                radius: 40,
                foregroundColor: Colors.transparent,
                backgroundImage: Image.asset(
                  imagePath,
                  width: 40,
                  height: 4,
                ).image,
              ),
              // Container(
              //   width: 20.w,
              //   height: 8.h,
              //   decoration: BoxDecoration(
              //     image: DecorationImage(
              //       image: AssetImage(imagePath),
              //       fit: BoxFit.cover,
              //     ),
              //     borderRadius: BorderRadius.circular(5.sp),
              //   ),
              // ),
              const SizedBox(width: 15),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 50.w,
                    height: 20.h,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 12.sp,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                radius: 40,
                foregroundColor: Colors.transparent,
                backgroundImage: AssetImage(imagePath),
              ),
              // Container(
              //   width: 20.w,
              //   height: 8.h,
              //   decoration: BoxDecoration(
              //     image: DecorationImage(
              //       image: AssetImage(imagePath),
              //       fit: BoxFit.cover,
              //     ),
              //     borderRadius: BorderRadius.circular(5.sp),
              //   ),
              // ),
              const SizedBox(width: 15),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 50.w,
                    height: 20.h,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 12.sp,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
