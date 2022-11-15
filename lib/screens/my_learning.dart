import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:udemy_clone/content/dev_content.dart';
import 'package:udemy_clone/content/featured_content.dart';
import 'package:udemy_clone/content/my_learning_content.dart';
import 'package:udemy_clone/screens/main_screen.dart';

import '../service/app_state.dart';
import '../utils/methods.dart';

class MyLearning extends StatefulWidget {
  const MyLearning({Key? key}) : super(key: key);

  @override
  State<MyLearning> createState() => _MyLearningState();
}

class _MyLearningState extends State<MyLearning> {
  final appStateController = Get.put(AppState());

  late SharedPreferences _pref;

  @override
  Widget build(BuildContext context) {
    debugPrint('tab index: ${appStateController.selectedIndex.value}');

    return Scaffold(
      body: Obx(() {
        return appStateController.isFilterIconVisible.isTrue
            ? const DevContent()
            : appStateController.selectedIndex.value == 0 ? const FeaturedContent() : const MyLearningContent();
      }),
    );
  }
}
