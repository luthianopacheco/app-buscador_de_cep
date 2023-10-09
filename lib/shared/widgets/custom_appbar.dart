import 'package:flutter/material.dart';
import 'package:get/get.dart';

customAppBar(String title, String route) {
  return AppBar(
    title: Text(
      title,
      style: const TextStyle(color: Color(0xff0474ac)),
    ),
    shadowColor: Colors.amber,
    bottom: PreferredSize(
        preferredSize: const Size.fromHeight(0),
        child: Container(
          height: 2,
          color: Colors.amber,
        )),
    foregroundColor: const Color(0xff0474ac),
    backgroundColor: Colors.white,
    centerTitle: true,
    leading: IconButton(
      icon: const Icon(Icons.arrow_back, color: Color(0xff0474ac)),
      onPressed: () {
        Get.toNamed(route);
      },
    ),
  );
}
