import 'package:flutter/material.dart';

class MyAppbar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  const MyAppbar({super.key, required this.title});
  @override
  Widget build(BuildContext context) {
    return PreferredSize(
        preferredSize: preferredSize,
        child: AppBar(
          backgroundColor: const Color.fromRGBO(72, 186, 63, 1),
          centerTitle: true,
          title: Text(
            title,
          ),
        ));
  }

  @override
  Size get preferredSize => const Size.fromHeight(40);
}
