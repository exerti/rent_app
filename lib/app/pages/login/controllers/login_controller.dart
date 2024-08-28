import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rentapp/app/routes/app_pages.dart';

class LoginController extends GetxController {
  TextEditingController usernamecontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();

  register() {
    Get.toNamed(Routes.REGISTER);
  }

  toHome() {
    Get.toNamed(Routes.HOME);
  }
}
