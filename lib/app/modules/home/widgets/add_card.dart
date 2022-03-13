import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:tasks_app/app/core/values/colors.dart';
import 'package:tasks_app/app/data/models/task.dart';
import 'package:tasks_app/app/modules/home/controller.dart';
import 'package:tasks_app/app/widgets/icons.dart';
import 'package:tasks_app/app/core/utils/extension.dart';

class AddCard extends StatelessWidget {
  final homeConroller = Get.find<HomeController>();
  AddCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final icons = getIcons();
    var squareWidth = Get.width - 12.0.wp;
    return Container(
      width: squareWidth / 2,
      height: squareWidth / 2,
      margin: EdgeInsets.all(3.0.wp),
      child: InkWell(
          onTap: () async {
            await Get.defaultDialog(
                titlePadding: EdgeInsets.symmetric(
                  vertical: 5.0.wp,
                ),
                radius: 5,
                title: 'Task Type',
                content: Form(
                  key: homeConroller.formKey,
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 3.0.wp),
                        child: TextFormField(
                          controller: homeConroller.editController,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Title',
                          ),
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return 'Please enter task\'s title';
                            }
                          },
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 5.0.wp),
                        child: Wrap(
                          spacing: 2.0.wp,
                          children: icons
                              .map((e) => Obx(() {
                                    final index = icons.indexOf(e);
                                    return ChoiceChip(
                                      selectedColor: Colors.grey[200],
                                      pressElevation: 0,
                                      backgroundColor: Colors.white,
                                      label: e,
                                      selected: homeConroller.chipIndex.value ==
                                          index,
                                      onSelected: (bool selected) {
                                        homeConroller.chipIndex.value ==
                                                selected
                                            ? index
                                            : 0;
                                      },
                                    );
                                  }))
                              .toList(),
                        ),
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: blue,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                            minimumSize: const Size(150, 40)),
                        onPressed: () {
                          if (homeConroller.formKey.currentState!.validate()) {
                            int icon = icons[homeConroller.chipIndex.value]
                                .icon!
                                .codePoint;
                            String color = icons[homeConroller.chipIndex.value]
                                .color!
                                .toHex();
                            var task = Task(
                              title: homeConroller.editController.text,
                              icon: icon,
                              color: color,
                            );

                            Get.back();
                            homeConroller.addTask(task)
                                ? EasyLoading.showSuccess('Create success')
                                : EasyLoading.showError('Duplicated task');
                          }
                        },
                        child: const Text('Confirm'),
                      )
                    ],
                  ),
                ));
            homeConroller.editController.clear();
            homeConroller.changeChipIndex(0);
          },
          child: DottedBorder(
            color: Colors.grey[400],
            dashPattern: const [8, 4],
            child: Center(
              child: Icon(
                Icons.add,
                size: 10.0.wp,
                color: Colors.grey,
              ),
            ),
          )),
    );
  }
}
