import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:udemy_clone/content/dev_content.dart';
import 'package:udemy_clone/content/featured_content.dart';
import 'package:udemy_clone/content/my_learning_content.dart';

import '../service/app_state.dart';

class MyLearning extends StatelessWidget {
  MyLearning({Key? key}) : super(key: key);

  final AppState appStateController = Get.find();

  @override
  Widget build(BuildContext context) {
    debugPrint('tab index: ${appStateController.selectedIndex.value}');
    return Scaffold(
      body: Obx(() {
        return appStateController.isFilterIconVisible.isTrue
            ? const DevContent()
            : appStateController.selectedIndex.value == 0
            ? const FeaturedContent()
            : const MyLearningContent();
      }),
    );
  }
}

