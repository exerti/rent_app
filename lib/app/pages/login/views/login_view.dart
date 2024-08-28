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
              TextField(
                controller: controller.usernamecontroller,
                decoration: const InputDecoration(
                  hintText: '请输入用户名',
                ),
              ),
              TextField(
                controller: controller.passwordcontroller,
                obscureText: true,
                decoration: const InputDecoration(
                  hintText: '请输入密码',
                ),
              ),
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
