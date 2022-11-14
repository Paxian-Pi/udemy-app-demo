import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../service/app_state.dart';

final appStateController = Get.put(AppState());

void showFeaturedOrMyLearningContent() {
  appStateController.changeTabStatus();
  appStateController.setSearchIconState();
  appStateController.setMyCoursesTextState();
}

void showFilterIcon() {
  appStateController.setFIlterIconState();
  appStateController.setSearchIconState();
  appStateController.setMyCoursesTextState();
  appStateController.setBackArrowState();
}