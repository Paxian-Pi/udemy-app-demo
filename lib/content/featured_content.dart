import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sizer/sizer.dart';
import 'package:udemy_clone/data/categories.dart';
import 'package:udemy_clone/data/courses.dart';
import 'package:udemy_clone/widgets/custom_button.dart';
import 'package:get/get.dart';
import 'package:udemy_clone/widgets/vertical_card_layout.dart';
import 'package:udemy_clone/widgets/rich_text.dart';

class FeaturedContent extends StatefulWidget {
  const FeaturedContent({Key? key}) : super(key: key);

  @override
  State<FeaturedContent> createState() => _FeaturedContentState();
}

class _FeaturedContentState extends State<FeaturedContent> {
  bool _isInfoBar = true;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // * Section 1
          Visibility(
            visible: _isInfoBar,
            maintainSize: false,
            maintainAnimation: true,
            maintainState: true,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 6.h,
              decoration: BoxDecoration(color: Colors.purple[700]),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: Container(
                      margin: EdgeInsets.only(left: 50.sp, right: 15.sp),
                      child: const Text(
                        'Future-ready skills on your schedule',
                        style: TextStyle(color: Colors.white, fontSize: 14),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      HapticFeedback.vibrate();
                      SystemSound.play(SystemSoundType.click);

                      setState(() {
                        _isInfoBar = false;
                      });
                    },
                    child: Container(
                      margin: EdgeInsets.only(left: 20.sp),
                      child: const Icon(
                        Icons.clear,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.3,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/img-main.jpg"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 10),
          // * Section 2
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Text(
                  'Learning that fits',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  'Skills for your present (and future)',
                  style: TextStyle(
                    color: Colors.grey.shade700,
                    fontSize: 10.sp,
                  ),
                )
              ],
            ),
          ),
          // * Section 3
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Categories',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        HapticFeedback.vibrate();
                        SystemSound.play(SystemSoundType.click);

                        showSnackbar('Not available...', 'This is a demo app!');
                      },
                      child: Text(
                        'See all',
                        style: TextStyle(
                          color: Colors.purple[700],
                          fontSize: 10.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: category1
                            .map((e) => CustomButton(
                                  text: '${e['name']}',
                                  padding:
                                      const EdgeInsets.only(top: 5, right: 10),
                                  onPressed: () {
                                    HapticFeedback.vibrate();
                                    SystemSound.play(SystemSoundType.click);

                                    showSnackbar(
                                        'What To Learn Today!', '${e['name']}');
                                  },
                                ))
                            .toList(),
                      ),
                      const SizedBox(height: 5),
                      Row(
                        children: category2
                            .map((e) => CustomButton(
                                  text: '${e['name']}',
                                  padding:
                                      const EdgeInsets.only(top: 5, right: 10),
                                  onPressed: () {
                                    HapticFeedback.vibrate();
                                    SystemSound.play(SystemSoundType.click);

                                    showSnackbar(
                                        'What To Learn Today!', '${e['name']}');
                                  },
                                ))
                            .toList(),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          // * Section 4
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // * Section 1
                const RichTextWidget(
                  leftText: 'Top courses in ',
                  rightText: 'Development',
                ),
                // Text(
                //   'Top courses in Development',
                //   style: TextStyle(
                //     color: Colors.black,
                //     fontSize: 16.sp,
                //     fontWeight: FontWeight.bold,
                //   ),
                // ),
                const SizedBox(height: 10),
                SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: dev
                            .map((e) => Padding(
                                  padding: const EdgeInsets.only(right: 15.0),
                                  child: VerticalCardLayout(
                                    onCardTap: () {
                                      HapticFeedback.vibrate();
                                      SystemSound.play(SystemSoundType.click);

                                      showSnackbar(
                                          '${e['title'].substring(0, 17) + '...'} Not wired!',
                                          'This is just a demo!');
                                    },
                                    imagePath: '${e['imagePath']}',
                                    title: '${e['title']}',
                                    tutor: '${e['tutor']}',
                                    rating: e['rating'],
                                    count: '${e['count']}',
                                    price: '${e['price']}',
                                    isBestSeller: e['isBestSeller'],
                                  ),
                                ))
                            .toList(),
                      ),
                      _seeAllWidget()
                    ],
                  ),
                ),
              ],
            ),
          ),
          // * Section5
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // * Section 1
                const RichTextWidget(
                  leftText: 'Top courses in ',
                  rightText: 'IT & Software',
                ),
                const SizedBox(height: 10),
                SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: itAndSoftware
                            .map((e) => Padding(
                                  padding: const EdgeInsets.only(right: 15.0),
                                  child: VerticalCardLayout(
                                    onCardTap: () {
                                      HapticFeedback.vibrate();
                                      SystemSound.play(SystemSoundType.click);

                                      showSnackbar(
                                          '${e['title'].substring(0, 15) + '...'} Not wired!',
                                          'This is just a demo!');
                                    },
                                    imagePath: '${e['imagePath']}',
                                    title: '${e['title']}',
                                    tutor: '${e['tutor']}',
                                    rating: e['rating'],
                                    count: '${e['count']}',
                                    price: '${e['price']}',
                                    isBestSeller: e['isBestSeller'],
                                  ),
                                ))
                            .toList(),
                      ),
                      _seeAllWidget()
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _seeAllWidget() {
    return GestureDetector(
      onTap: () {
        HapticFeedback.vibrate();
        SystemSound.play(SystemSoundType.click);

        showSnackbar('Can\'t see all...', 'This is a demo app!');
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(3.sp),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.0.w, vertical: 18.h),
          child: Center(
            child: Text(
              'See all',
              style: TextStyle(
                  color: Colors.purple[800],
                  fontSize: 15.sp,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }

  void showSnackbar(String msgTitle, String message) {
    Get.snackbar(
      '',
      '',
      titleText: Text(
        msgTitle,
        textAlign: TextAlign.center,
        style: const TextStyle(
          color: Color(0xFF080808),
        ),
      ),
      messageText: Text(
        message,
        textAlign: TextAlign.center,
        style: const TextStyle(
          color: Colors.black,
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
      backgroundColor: Colors.green[100],
      snackPosition: SnackPosition.BOTTOM,
    );
  }
}
