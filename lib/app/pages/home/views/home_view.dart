import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:rentapp/app/pages/index/views/index_view.dart';

import '../controllers/home_controller.dart';

const bottomBar = [
  BottomNavigationBarItem(
    icon: Icon(Icons.home),
    label: '首页',
  ),
  BottomNavigationBarItem(
    icon: Icon(Icons.search),
    label: '找房',
  ),
  BottomNavigationBarItem(
    icon: Icon(Icons.message),
    label: '咨询',
  ),
  BottomNavigationBarItem(
    icon: Icon(Icons.person),
    label: '我的',
  ),
];

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        //  physics: const NeverScrollableScrollPhysics(),
        controller: controller.pageController,
        onPageChanged: (value) => controller.currentIndex.value = value,
        children: [
          const IndexView(),
          Container(color: Colors.green),
          Container(color: Colors.blue),
          Container(color: const Color.fromARGB(255, 19, 28, 35)),
        ],
      ),
      bottomNavigationBar: Obx(() => BottomNavigationBar(
            items: bottomBar,
            type: BottomNavigationBarType.fixed,
            selectedItemColor: const Color.fromRGBO(0, 102, 255, 1),
            unselectedItemColor: Colors.black,
            backgroundColor: const Color.fromRGBO(234, 234, 234, 1),
            currentIndex: controller.currentIndex.value,
            onTap: (value) {
              controller.changePage(value);
            },
          )),
    );
  }
}
