import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class RichTextWidget extends StatelessWidget {
  final String leftText;
  final String rightText;

  const RichTextWidget(
      {Key? key, required this.leftText, required this.rightText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
      overflow: TextOverflow.clip,
      textAlign: TextAlign.end,
      textDirection: TextDirection.rtl,
      softWrap: true,
      // maxLines: 1,
      textScaleFactor: 1,
      text: TextSpan(
        text: leftText,
        style: TextStyle(
          color: Colors.black,
          fontSize: 17.sp,
          fontWeight: FontWeight.bold,
        ),
        children: <TextSpan>[
          TextSpan(
            text: rightText,
            style: TextStyle(
              color: Colors.purple[800],
              fontSize: 17.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
