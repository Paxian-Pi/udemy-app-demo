import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../service/app_state.dart';

final AppState appStateController = Get.find();

void showFeaturedOrMyLearningContent() {
  appStateController.changeTabStatus();
  appStateController.setSearchIconState();
  appStateController.setMyCoursesTextState();
}

void showFilterIcon() {
  appStateController.setFilterIconState();
  appStateController.setSearchIconState();
  appStateController.setMyCoursesTextState();
  appStateController.setBackArrowState();
}