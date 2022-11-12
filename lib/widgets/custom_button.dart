import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:udemy_clone/utils/constants.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final Function? onPressed;
  final EdgeInsetsGeometry? padding;

  const CustomButton({
    Key? key,
    required this.text,
    this.onPressed,
    this.padding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onPressed!(),
      child: Padding(
        padding: padding ?? EdgeInsets.zero,
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.black,
              width: 1,
            ),
            borderRadius: BorderRadius.circular(22.0.sp),
            // color: Colors.black,
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 5.0.w, vertical: 1.5.h),
            child: Center(
              child: Text(
                text,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 12.sp,
                  shadows: kTextShadow,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
