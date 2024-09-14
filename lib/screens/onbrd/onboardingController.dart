import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app/screens/Home/homeScreen.dart';

class Onboardingcontroller extends GetxController {

  static Onboardingcontroller get Instance => Get.find();

  final pageController = PageController();
  Rx<int> currentIndx = 0.obs;







  void updatePage(index) => currentIndx.value = index;
   void nextPage() {
    if (currentIndx.value < 2) {
      int nextPage = currentIndx.value + 1;
      pageController.animateToPage(
        nextPage,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    } else {
      Get.offAll(() => Homescreen(), transition: Transition.rightToLeft, duration: const Duration(milliseconds: 750));
    }
  }

  

  void dotClicked(int index)   {
    
    currentIndx.value = index;
  pageController.animateToPage(index,duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,);
  }
  
  
}