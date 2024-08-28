import 'package:bruno/bruno.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/index_controller.dart';

class IndexView extends GetView<IndexController> {
  const IndexView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: const Color.fromRGBO(234, 234, 234, 1),
      body: ListView(
        shrinkWrap: true,
        children: [
          BrnSearchAppbar(themeData: BrnAppBarConfig.light()),
          const SwiperBox(),
          const Menu(),
          const Title(
            text: '好房推荐',
          )
        ],
      ),
    );
  }
}

class Menu extends GetView<IndexController> {
  const Menu({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 100,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
              child: MenuItem(
            text: '整租',
            url: 'assets/images/home_index_navigator_total.png',
          )),
          Expanded(
              child: MenuItem(
            text: '合租',
            url: 'assets/images/home_index_navigator_share.png',
          )),
          Expanded(
              child: MenuItem(
            text: '地图找房',
            url: 'assets/images/home_index_navigator_map.png',
          )),
          Expanded(
              child: MenuItem(
            text: '去出租',
            url: 'assets/images/home_index_navigator_rent.png',
          )),
        ],
      ),
    );
  }
}

class SwiperBox extends StatelessWidget {
  const SwiperBox({super.key});

  @override
  Widget build(BuildContext context) {
    List<Map<String, Object>> images = [
      {
        "image_src": "https://api-hmugo-web.itheima.net/pyg/banner1.png",
        "open_type": "navigate",
        "goods_id": 129,
        "navigator_url": "/pages/goods_detail/main?goods_id=129"
      },
      {
        "image_src": "https://api-hmugo-web.itheima.net/pyg/banner2.png",
        "open_type": "navigate",
        "goods_id": 395,
        "navigator_url": "/pages/goods_detail/main?goods_id=395"
      },
      {
        "image_src": "https://api-hmugo-web.itheima.net/pyg/banner3.png",
        "open_type": "navigate",
        "goods_id": 38,
        "navigator_url": "/pages/goods_detail/main?goods_id=38"
      }
    ];
    return Container(
      margin: const EdgeInsets.only(top: 7),
      color: const Color.fromRGBO(234, 234, 234, 1),
      width: double.infinity,
      child: Image.network(
        "https://api-hmugo-web.itheima.net/pyg/banner2.png",
        fit: BoxFit.fitWidth,
      ),
    );
  }
}

class MenuItem extends StatelessWidget {
  final String url;
  final String text;
  const MenuItem({super.key, required this.url, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            url,
            width: 55,
            height: 55,
          ),
          Text(text),
        ],
      ),
    );
  }
}

class Title extends StatelessWidget {
  final String text;
  const Title({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      margin: const EdgeInsets.only(top: 6),
      padding: const EdgeInsets.only(left: 13, right: 13),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text,
            style: const TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.normal),
          ),
          const Text('更多')
        ],
      ),
    );
  }
}
