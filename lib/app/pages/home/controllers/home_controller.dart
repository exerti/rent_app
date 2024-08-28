import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  RxInt currentIndex = 0.obs;
  PageController pageController = PageController(initialPage: 0);
  late TabController tabController;

  changePage(int index) {
    currentIndex.value = index;
    pageController.animateToPage(index,
        duration: const Duration(milliseconds: 300), curve: Curves.easeIn);
  }
}
