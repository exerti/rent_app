import 'package:get/get.dart';

import '../pages/about/bindings/about_binding.dart';
import '../pages/about/views/about_view.dart';
import '../pages/home/bindings/home_binding.dart';
import '../pages/home/views/home_view.dart';
import '../pages/index/bindings/index_binding.dart';
import '../pages/index/views/index_view.dart';
import '../pages/login/bindings/login_binding.dart';
import '../pages/login/views/login_view.dart';
import '../pages/my/bindings/my_binding.dart';
import '../pages/my/views/my_view.dart';
import '../pages/register/bindings/register_binding.dart';
import '../pages/register/views/register_view.dart';

// ignore_for_file: constant_identifier_names

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.LOGIN;

  static final routes = [
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.REGISTER,
      page: () => const RegisterView(),
      binding: RegisterBinding(),
    ),
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.INDEX,
      page: () => const IndexView(),
      binding: IndexBinding(),
    ),
    GetPage(
      name: _Paths.ABOUT,
      page: () => const AboutView(),
      binding: AboutBinding(),
    ),
    GetPage(
      name: _Paths.MY,
      page: () => const MyView(),
      binding: MyBinding(),
    ),
  ];
}
