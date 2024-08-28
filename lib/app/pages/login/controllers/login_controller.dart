import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rentapp/app/routes/app_pages.dart';

class LoginController extends GetxController {
  TextEditingController usernamecontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  RxBool isShowPassword = false.obs;
  FocusNode passWordFocus = FocusNode();

  register() {
    Get.toNamed(Routes.REGISTER);
  }

  toHome() {
    Get.offAllNamed(Routes.HOME);
  }
}
