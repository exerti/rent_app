import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../routes/app_pages.dart';

class RegisterController extends GetxController {
  TextEditingController usernamecontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  RxBool isShowPassword = false.obs;
  FocusNode passWordFocus = FocusNode();

  login() {
    Get.offAllNamed(Routes.LOGIN);
  }
}
