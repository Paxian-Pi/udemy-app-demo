import 'package:get/state_manager.dart';

class AppState extends GetxController {
  RxBool isFeatured = true.obs;
  RxBool isNavbarSearIconVisible = false.obs;
  RxBool isFilterIconVisible = false.obs;
  RxBool isMyCoursesTextVisible = false.obs;
  RxBool isBackArrow = false.obs;
  RxInt selectedIndex = 0.obs;

  void changeTabStatus() {
    isFeatured.toggle();
  }

  void setSearchIconState() {
    isNavbarSearIconVisible.toggle();
  }
  
  void setFIlterIconState() {
    isFilterIconVisible.toggle();
  }

  void setMyCoursesTextState() {
    isMyCoursesTextVisible.toggle();
  }
  
  void setBackArrowState() {
    isBackArrow.toggle();
  }
  void setTabIndex(int value) {
    selectedIndex.value = value;
  }
}
