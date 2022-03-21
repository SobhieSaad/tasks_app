import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tasks_app/app/core/utils/extension.dart';
import 'package:tasks_app/app/modules/home/controller.dart';

class DetailPage extends StatelessWidget {
  final homeController = Get.find<HomeController>();

  DetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(children: [
      Padding(
        padding: EdgeInsets.all(3.0.wp),
        child: Row(
          children: [
            IconButton(
              onPressed: () {
                Get.back();
              },
              icon: const Icon(Icons.arrow_back, color: Colors.black),
            )
          ],
        ),
      ),
    ]));
  }
}
