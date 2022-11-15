import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:udemy_clone/data/navBarItem.dart';
import 'package:udemy_clone/screens/my_learning.dart';
import 'package:udemy_clone/service/app_state.dart';
import 'package:get/get.dart';

import '../content/featured_content.dart';
import '../content/my_learning_content.dart';
import '../utils/methods.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final appStateController = Get.put(AppState());

  late SharedPreferences _pref;

  int _selectedIndex = 0;

  bool _isFeatured = true;

  @override
  void initState() {
    super.initState();

    _tabSelector();
  }

  @override
  Widget build(BuildContext context) {
    debugPrint('${appStateController.isFeatured}');
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        shadowColor: Colors.transparent,
        title: Row(
          children: [
            Obx(() {
              return GestureDetector(
                onTap: () {
                  HapticFeedback.vibrate();
                  SystemSound.play(SystemSoundType.click);

                  if (appStateController.isFilterIconVisible.isTrue) {
                    // appStateController.setFIlterIconState();
                    // appStateController.setSearchIconState();
                    // appStateController.setMyCoursesTextState();
                    // appStateController.setBackArrowState();

                    showFilterIcon();
                  }
                },
                child: Visibility(
                  visible: appStateController.isBackArrow.isTrue,
                  maintainSize: false,
                  maintainAnimation: true,
                  maintainState: true,
                  child: const Icon(
                    Icons.arrow_back_ios_new,
                    color: Colors.black,
                  ),
                ),
              );
            }),
            Obx(() {
              return Visibility(
                visible: appStateController.isMyCoursesTextVisible.isTrue,
                maintainSize: false,
                maintainAnimation: true,
                maintainState: true,
                child: const Text(
                  'My courses',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                  ),
                ),
              );
            }),
          ],
        ),
        actions: [
          Obx(() {
            return Visibility(
              visible: appStateController.isFilterIconVisible.isTrue,
              maintainSize: false,
              maintainAnimation: true,
              maintainState: true,
              child: IconButton(
                onPressed: () {
                  HapticFeedback.vibrate();
                  // SystemSound.play(SystemSoundType.click);

                  showSnackbar(SnackPosition.BOTTOM,
                      'Filter - Not active now...', 'Check back later!');
                },
                icon: const Icon(
                  Icons.filter_list,
                  color: Colors.black,
                ),
              ),
            );
          }),
          Obx(() {
            return Visibility(
              visible: appStateController.isNavbarSearIconVisible.isTrue,
              maintainSize: false,
              maintainAnimation: true,
              maintainState: true,
              child: IconButton(
                onPressed: () {
                  HapticFeedback.vibrate();
                  // SystemSound.play(SystemSoundType.click);

                  showSnackbar(SnackPosition.BOTTOM,
                      'Search - Not active now...', 'Check back later!');
                },
                icon: const Icon(
                  Icons.search,
                  color: Colors.black,
                ),
              ),
            );
          }),
          IconButton(
            onPressed: () {
              HapticFeedback.vibrate();
              // SystemSound.play(SystemSoundType.click);

              showSnackbar(SnackPosition.BOTTOM, 'Checkout - Not active now...',
                  'Check back later!');
            },
            icon: const Icon(
              Icons.shopping_cart_outlined,
              color: Colors.black,
            ),
          ),
        ],
      ),
      body: appStateController.isFeatured.isTrue
          ? const FeaturedContent()
          : const MyLearning(),
      bottomNavigationBar: Obx(() {
        return BottomNavigationBar(
          backgroundColor: Colors.white,
          // currentIndex: _selectedIndex,
          currentIndex: appStateController.selectedIndex.value,
          showSelectedLabels: true,
          showUnselectedLabels: false,
          fixedColor: Colors.black,
          type: BottomNavigationBarType.fixed,
          onTap: _onItemTapped,
          items: navBarItem
              .map(
                (e) => BottomNavigationBarItem(
              icon: Image.asset(
                '${e['icon']}',
                width: 24.0,
              ),
              activeIcon: Image.asset(
                '${e['activeIcon']}',
                width: 24.0,
              ),
              label: '${e['label']}',
            ),
          )
              .toList(),
        );
      }),

      // body: CustomScrollView(
      //   slivers: [
      //     SliverAppBar(
      //       shadowColor: Colors.transparent.withOpacity(0.1),
      //       elevation: 0,
      //       backgroundColor: primaryColor,
      //       automaticallyImplyLeading: false,
      //       pinned: true,
      //       snap: false,
      //       floating: false,
      //       expandedHeight: 22.0.h,
      //       actions: [
      //         Padding(
      //           padding: EdgeInsets.only(right: 3.w),
      //           child: IconButton(
      //             onPressed: () {},
      //             icon: const Icon(
      //               Icons.shopping_cart_outlined,
      //               color: Colors.black,
      //             ),
      //           ),
      //         ),
      //       ],
      //       flexibleSpace: FlexibleSpaceBar(
      //         centerTitle: true,
      //         // title: const Text('Learning that fits'),
      //         background: Image.asset('assets/img-main.jpg'),
      //       ),
      //     ),
      //     SliverFillRemaining(
      //       child: Column(
      //         children: [
      //           Column(
      //             crossAxisAlignment: CrossAxisAlignment.start,
      //             children: [
      //               SizedBox(height: 4.h),
      //               Padding(
      //                 padding: EdgeInsets.symmetric(horizontal: 4.h),
      //                 child: Wrap(
      //                   children: [
      //                     Text(
      //                       'Learning that fits',
      //                       style: TextStyle(
      //                         color: Colors.black,
      //                         fontSize: 20.sp,
      //                         fontWeight: FontWeight.bold,
      //                       ),
      //                     ),
      //                     Text(
      //                       'Skills for your present (and future)',
      //                       style: TextStyle(
      //                         color: Colors.grey.shade400,
      //                         fontSize: 10.sp,
      //                         fontWeight: FontWeight.bold,
      //                       ),
      //                     )
      //                   ],
      //                 ),
      //               ),
      //               // SizedBox(height: 3.h),
      //               // SingleChildScrollView(
      //               //   physics: const BouncingScrollPhysics(),
      //               //   scrollDirection: Axis.horizontal,
      //               //   child: Padding(
      //               //     padding: EdgeInsets.symmetric(horizontal: 3.h),
      //               //     child: Row(
      //               //       children: movieDetails!.getGenresList(context),
      //               //     ),
      //               //   ),
      //               // ),
      //               SizedBox(height: 1.h),
      //             ],
      //           ),
      //           // Expanded(
      //           //   child: Padding(
      //           //     padding: EdgeInsets.symmetric(
      //           //       horizontal: 3.h,
      //           //       vertical: 3.h,
      //           //     ),
      //           //     child: Column(
      //           //       crossAxisAlignment: CrossAxisAlignment.start,
      //           //       children: [
      //           //         Padding(
      //           //           padding: EdgeInsets.only(
      //           //             right: 1.h,
      //           //             left: 1.h,
      //           //             bottom: 1.h,
      //           //           ),
      //           //           child: Container(
      //           //             child: Text(
      //           //               kStoryLineTitleText,
      //           //               style: kSmallTitleTextStyle,
      //           //             ),
      //           //           ),
      //           //         ),
      //           //         Expanded(
      //           //           child: Padding(
      //           //             padding: EdgeInsets.only(
      //           //               right: 1.h,
      //           //               left: 1.h,
      //           //               top: 1.h,
      //           //               bottom: 4.h,
      //           //             ),
      //           //             child: Text(
      //           //               movieDetails!.overview,
      //           //               style: TextStyle(
      //           //                 fontSize: 16.sp,
      //           //                 color: Color(0xFFC9C9C9),
      //           //               ),
      //           //             ),
      //           //           ),
      //           //         ),
      //           //       ],
      //           //     ),
      //           //   ),
      //           // ),
      //         ],
      //       ),
      //     )
      //   ],
      // ),
    );
  }

  void _tabSelector() async {
    _pref = await SharedPreferences.getInstance();
    _pref.setInt('tabIndex', appStateController.selectedIndex.value);
  }

  void _onItemTapped(int index) async {
    HapticFeedback.vibrate();
    // SystemSound.play(SystemSoundType.click);

    // setState(() => _selectedIndex = index);
    setState(() => appStateController.setTabIndex(index));

    debugPrint('${appStateController.selectedIndex.value}');

    switch (index) {
      case 0:
        if (appStateController.isFeatured.isFalse) {
          showFeaturedOrMyLearningContent();
        }

        if (appStateController.isFilterIconVisible.isTrue) {
          showFilterIcon();
        }
        // isFeatured = true;
        break;
      case 2:
        if (appStateController.isFeatured.isTrue) {
          showFeaturedOrMyLearningContent();
        }

        if (appStateController.isFilterIconVisible.isTrue) {
          showFilterIcon();
        }
        // isFeatured = false;
        break;
    }

    if (index == 0 || index == 2) {
      _pref = await SharedPreferences.getInstance();
      _pref.setInt('tabIndex', index);

      return;
      // Get.to(
      //   () => const MyLearning(),
      //   duration: const Duration(milliseconds: 400),
      //   transition: Transition.leftToRight,
      // );
    }

    showSnackbar(SnackPosition.TOP, 'Not active now...', 'Check back later!');

    if(_pref.getInt('tabIndex') == 0 && (index == 1 || index == 3 || index == 4)) {
      Timer(const Duration(milliseconds: 1500), () {
        // setState(() => _selectedIndex = 0);
        setState(() => appStateController.setTabIndex(0));
      });
    }

    if(_pref.getInt('tabIndex') == 2 && (index == 1 || index == 3 || index == 4)) {
      Timer(const Duration(milliseconds: 1500), () {
        // setState(() => _selectedIndex = 2);
        setState(() => appStateController.setTabIndex(2));
      });
    }
  }

  void showSnackbar(SnackPosition position, String title, String message) {
    Get.snackbar(
      '',
      '',
      titleText: Text(
        title,
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
      snackPosition: position,
    );
  }
}
