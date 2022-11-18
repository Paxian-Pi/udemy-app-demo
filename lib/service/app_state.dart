import 'package:flutter/cupertino.dart';
import 'package:get/state_manager.dart';

class AppState extends GetxController {
  RxBool isFeatured = true.obs;
  RxBool isNavbarSearIconVisible = false.obs;
  RxBool isFilterIconVisible = false.obs;
  RxBool isMyCoursesTextVisible = false.obs;
  RxBool isBackArrow = false.obs;
  RxInt selectedIndex = 0.obs;

  // final count = 0.obs;
  // late Worker worker;
  //
  // @override
  // void onInit() {
  //   worker = ever(count, (value) {
  //     debugPrint('counter changed to: $value');
  //     if (value == 10) worker.dispose();
  //   }, condition: () => count > 5);
  //
  //   super.onInit();
  // }
  //
  // void increment() => count + 1;

  void changeTabStatus() => isFeatured.toggle();

  void setSearchIconState() => isNavbarSearIconVisible.toggle();

  void setFilterIconState() => isFilterIconVisible.toggle();

  void setMyCoursesTextState() => isMyCoursesTextVisible.toggle();

  void setBackArrowState() => isBackArrow.toggle();

  void setTabIndex(int value) {
    selectedIndex.value = value;
    update();
  }
}
