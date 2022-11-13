import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:udemy_clone/content/dev_content.dart';
import 'package:udemy_clone/content/my_learning_content.dart';

import '../service/app_state.dart';

class MyLearning extends StatefulWidget {
  const MyLearning({Key? key}) : super(key: key);

  @override
  State<MyLearning> createState() => _MyLearningState();
}

class _MyLearningState extends State<MyLearning> {
  final appStateController = Get.put(AppState());

  @override
  Widget build(BuildContext context) {
    debugPrint('filter State: ${appStateController.isFilterIconVisible}');

    return Scaffold(
      body: Obx(() {
        return appStateController.isFilterIconVisible.isTrue
            ? const DevContent()
            : const MyLearningContent();
      }),
    );
  }
}
