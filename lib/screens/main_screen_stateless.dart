import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:udemy_clone/service/app_state.dart';

import '../content/featured_content.dart';
import '../data/navBarItem.dart';
import '../utils/methods.dart';
import 'my_learning.dart';

class MainScreenStateless extends StatelessWidget {
  MainScreenStateless({Key? key}) : super(key: key);

  final appController = Get.put(AppState());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppState>(
        initState: (controller) => _tabSelector(),
        builder: (AppState appController) {
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

                        if (appController.isFilterIconVisible.isTrue) {
                          showFilterIcon();
                        }
                      },
                      child: Visibility(
                        visible: appController.isBackArrow.isTrue,
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
                      visible: appController.isMyCoursesTextVisible.isTrue,
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
                    visible: appController.isFilterIconVisible.isTrue,
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
                    visible: appController.isNavbarSearIconVisible.isTrue,
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

                    showSnackbar(SnackPosition.BOTTOM,
                        'Checkout - Not active now...', 'Check back later!');
                  },
                  icon: const Icon(
                    Icons.shopping_cart_outlined,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            body: appController.isFeatured.isTrue
                ? const FeaturedContent()
                : const MyLearning(),
            bottomNavigationBar: BottomNavigationBar(
              backgroundColor: Colors.white,
              // currentIndex: _selectedIndex,
              currentIndex: appController.selectedIndex.value,
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
            ),
          );
        });
  }

  void _tabSelector() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setInt('tabIndex', appController.selectedIndex.value);
  }

  void _setTabIndex(int index) {
    appController.setTabIndex(index);
  }

  void _onItemTapped(int index) async {
    HapticFeedback.vibrate();
    // SystemSound.play(SystemSoundType.click);

    _setTabIndex(index);

    switch (index) {
      case 0:
        if (appController.isFeatured.isFalse) {
          showFeaturedOrMyLearningContent();
        }

        if (appController.isFilterIconVisible.isTrue) {
          showFilterIcon();
        }
        // isFeatured = true;
        break;
      case 2:
        if (appController.isFeatured.isTrue) {
          showFeaturedOrMyLearningContent();
        }

        if (appController.isFilterIconVisible.isTrue) {
          showFilterIcon();
        }
        // isFeatured = false;
        break;
    }

    SharedPreferences pref = await SharedPreferences.getInstance();

    if (index == 0 || index == 2) {
      pref.setInt('tabIndex', index);

      return;
    }

    showSnackbar(SnackPosition.TOP, 'Not active now...', 'Check back later!');

    if (pref.getInt('tabIndex') == 0 &&
        (index == 1 || index == 3 || index == 4)) {
      Timer(const Duration(milliseconds: 1500), () {
        _setTabIndex(0);
      });
    }

    if (pref.getInt('tabIndex') == 2 &&
        (index == 1 || index == 3 || index == 4)) {
      Timer(const Duration(milliseconds: 1500), () {
        _setTabIndex(2);
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
