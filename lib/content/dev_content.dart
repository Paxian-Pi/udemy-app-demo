import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sizer/sizer.dart';
import 'package:udemy_clone/data/categories.dart';
import 'package:udemy_clone/data/courses.dart';
import 'package:udemy_clone/utils/constants.dart';
import 'package:udemy_clone/utils/methods.dart';
import 'package:udemy_clone/widgets/custom_button.dart';
import 'package:get/get.dart';
import 'package:udemy_clone/widgets/instructor_cards.dart';
import 'package:udemy_clone/widgets/vertical_card_layout.dart';
import 'package:udemy_clone/widgets/horizontal_card_layout.dart';

import '../service/app_state.dart';

class DevContent extends StatefulWidget {
  const DevContent({Key? key}) : super(key: key);

  @override
  State<DevContent> createState() => _DevContentState();
}

class _DevContentState extends State<DevContent> {
  final AppState appStateController = Get.find();

  @override
  Widget build(BuildContext context) {
    debugPrint(
        'filter icon visible: ${appStateController.isFilterIconVisible}');
    return WillPopScope(
      onWillPop: (() async {
        if (appStateController.isFilterIconVisible.isTrue) {
          showOrHideFilterIcon();

          return false;
        }
        return true;
      }),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Text(
                    'Developments',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            // * Section 3

            // * Courses to get you started
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // * Section 1
                  // const RichTextWidget(
                  //   leftText: 'Top courses in ',
                  //   rightText: 'Development',
                  // ),
                  Text(
                    'Courses to get you started',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
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
            // * Featured courses
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Featured courses',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                    ),
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
            ),
            // * Popular Topics
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Popular Topics',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: category1
                              .map(
                                (e) => CustomButton(
                                  text: '${e['name']}',
                                  padding:
                                      const EdgeInsets.only(top: 5, right: 10),
                                  onPressed: () {
                                    HapticFeedback.vibrate();
                                    SystemSound.play(SystemSoundType.click);

                                    showSnackbar(
                                        'What To Learn Today!', '${e['name']}');
                                  },
                                ),
                              )
                              .toList(),
                        ),
                        const SizedBox(height: 5),
                        Row(
                          children: category2
                              .map(
                                (e) => CustomButton(
                                  text: '${e['name']}',
                                  padding:
                                      const EdgeInsets.only(top: 5, right: 10),
                                  onPressed: () {
                                    HapticFeedback.vibrate();
                                    SystemSound.play(SystemSoundType.click);

                                    showSnackbar(
                                        'What To Learn Today!', '${e['name']}');
                                  },
                                ),
                              )
                              .toList(),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            // * Subcategories
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Subcategories',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: category1
                              .map(
                                (e) => CustomButton(
                                  text: '${e['name']}',
                                  padding:
                                      const EdgeInsets.only(top: 5, right: 10),
                                  onPressed: () {
                                    HapticFeedback.vibrate();
                                    SystemSound.play(SystemSoundType.click);

                                    showSnackbar(
                                        'What To Learn Today!', '${e['name']}');
                                  },
                                ),
                              )
                              .toList(),
                        ),
                        const SizedBox(height: 5),
                        Row(
                          children: category2
                              .map(
                                (e) => CustomButton(
                                  text: '${e['name']}',
                                  padding:
                                      const EdgeInsets.only(top: 5, right: 10),
                                  onPressed: () {
                                    HapticFeedback.vibrate();
                                    SystemSound.play(SystemSoundType.click);

                                    showSnackbar(
                                        'What To Learn Today!', '${e['name']}');
                                  },
                                ),
                              )
                              .toList(),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            // * Top instrctors
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // * Section 1
                  // const RichTextWidget(
                  //   leftText: 'Top courses in ',
                  //   rightText: 'Development',
                  // ),
                  Text(
                    'Top instructors',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20),
                  SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: dev
                          .map((e) => const Padding(
                              padding: EdgeInsets.only(right: 15.0),
                              child: InstructorCards(
                                  imagePath: 'assets/pax.jpg',
                                  title:
                                      'Pius Ifodo\nDeveloper and Lead Instructor\nLagos, Nigeria')))
                          .toList(),
                    ),
                  ),
                ],
              ),
            ),

            // * All courses
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'All courses',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16.sp,
                    ),
                  ),
                  const SizedBox(height: 10),
                  SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: allCourses
                          .map((e) => Padding(
                                padding: const EdgeInsets.only(right: 15.0),
                                child: HorizontalCardLayout(
                                  onCardTap: () {
                                    HapticFeedback.vibrate();
                                    SystemSound.play(SystemSoundType.click);

                                    showSnackbar(
                                        '${e['title'].substring(0, 10) + '...'} Not wired!',
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
                  ),
                ],
              ),
            ),
          ],
        ),
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
