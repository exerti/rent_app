import 'package:bruno/bruno.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../widgets/my_appbar.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const MyAppbar(
          title: '登录',
        ),
        body: Padding(
          padding: const EdgeInsets.only(left: 12, right: 12),
          child: Column(
            children: [
              const SizedBox(
                height: 8,
              ),
              TextField(
                controller: controller.usernamecontroller,
                decoration: const InputDecoration(
                  labelText: '账号',
                  hintText: '请输入用户名',
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Obx(() => TextField(
                    focusNode: controller.passWordFocus,
                    controller: controller.passwordcontroller,
                    obscureText: !controller.isShowPassword.value,
                    decoration: InputDecoration(
                        labelText: '输入密码',
                        hintText: '请输入密码',
                        suffix: GestureDetector(
                          onTap: () {
                            controller.isShowPassword.value =
                                !controller.isShowPassword.value;
                          },
                          child: controller.isShowPassword.value
                              ? const Icon(Icons.visibility_off_sharp)
                              : const Icon(Icons.visibility_sharp),
                        )),
                    onTapOutside: (event) =>
                        {controller.passWordFocus.unfocus()},
                  )),
              const SizedBox(
                height: 20,
              ),
              BrnBigMainButton(
                title: '登录',
                onTap: () => {controller.toHome()},
              ),
              const SizedBox(
                height: 20,
              ),
              RichText(
                  text: TextSpan(children: [
                const TextSpan(
                    text: '您还没有账号？', style: TextStyle(color: Colors.grey)),
                TextSpan(
                    text: '去注册',
                    style: const TextStyle(color: Colors.blue),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        controller.register();
                      }),
              ]))
            ],
          ),
        ));
  }
}
