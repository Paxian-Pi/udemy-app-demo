import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:udemy_clone/utils/methods.dart';

import '../service/app_state.dart';

class MyLearningContent extends StatefulWidget {
  const MyLearningContent({Key? key}) : super(key: key);

  @override
  State<MyLearningContent> createState() => _MyLearningContentState();
}

class _MyLearningContentState extends State<MyLearningContent> {
  final appStateController = Get.put(AppState());

  @override
  Widget build(BuildContext context) {
    debugPrint('filter State: ${appStateController.isFilterIconVisible}');
    return WillPopScope(
      onWillPop: () async {
        if (appStateController.isFeatured.isFalse) {
          /// return to main activity, on back pressed
          showFeaturedOrMyLearningContent();
          setState(() => appStateController.setTabIndex(0));

          return false;
        }
        return true;
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // * Section 1
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.4,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/img-learn.jpg"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(height: 30),
              // * Section 2
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Browse categories',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14.sp,
                      ),
                    ),
                    const SizedBox(height: 20),
                    GestureDetector(
                      onTap: () {
                        HapticFeedback.vibrate();
                        SystemSound.play(SystemSoundType.click);

                        appStateController.setSearchIconState();
                        appStateController.setFIlterIconState();
                        appStateController.setMyCoursesTextState();
                        appStateController.setBackArrowState();
                      },
                      child: Row(
                        children: const [
                          Icon(
                            Icons.integration_instructions_outlined,
                            color: Colors.black,
                            size: 20,
                          ),
                          SizedBox(width: 10),
                          Text(
                            'Development',
                            style: TextStyle(color: Colors.black, fontSize: 14),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    GestureDetector(
                      onTap: () {
                        HapticFeedback.vibrate();
                        SystemSound.play(SystemSoundType.click);

                        showSnackbar(SnackPosition.BOTTOM, 'Not available...',
                            'Only "Development" category is currently available!');
                      },
                      child: Row(
                        children: const [
                          Icon(
                            Icons.connected_tv,
                            color: Colors.black,
                            size: 20,
                          ),
                          SizedBox(width: 10),
                          Text(
                            'IT & Software',
                            style: TextStyle(color: Colors.black, fontSize: 14),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    GestureDetector(
                      onTap: () {
                        HapticFeedback.vibrate();
                        SystemSound.play(SystemSoundType.click);

                        showSnackbar(SnackPosition.BOTTOM, 'Not available...',
                            'Only "Development" category is currently available!');
                      },
                      child: Row(
                        children: const [
                          Icon(
                            Icons.style_outlined,
                            color: Colors.black,
                            size: 20,
                          ),
                          SizedBox(width: 10),
                          Text(
                            'Lifestyle',
                            style: TextStyle(color: Colors.black, fontSize: 14),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
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
