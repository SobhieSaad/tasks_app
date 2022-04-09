import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';
import 'package:tasks_app/app/core/utils/extension.dart';
import 'package:tasks_app/app/core/values/colors.dart';
import 'package:tasks_app/app/modules/home/controller.dart';

class ReportPage extends StatelessWidget {
  final homeController = Get.find<HomeController>();
  ReportPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Obx(
          () {
            var createdTasks = homeController.getTotalDoneTasks();
            var completedTasks = homeController.getTotalDoneTasks();
            var liveTasks = createdTasks - completedTasks;
            var percent = (completedTasks / createdTasks * 100).toString();
            return ListView(children: [
              Padding(
                padding: EdgeInsets.all(4.0.wp),
                child: Text(
                  'Report page',
                  style: TextStyle(
                    fontSize: 24.0.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 4.0.wp,
                ),
                child: Text(DateFormat.yMMMMd().format(DateTime.now()),
                    style: TextStyle(fontSize: 14.0.sp, color: Colors.grey)),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 3.0.wp,
                  horizontal: 4.0.wp,
                ),
                child: const Divider(thickness: 2),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 3.0.wp,
                  horizontal: 5.0.wp,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildStatus(Colors.green, liveTasks, 'Live Tasks'),
                    _buildStatus(Colors.orange, completedTasks, 'Completed'),
                    _buildStatus(Colors.blue, createdTasks, 'Created'),
                  ],
                ),
              ),
              SizedBox(
                height: 8.0.wp,
              ),
              UnconstrainedBox(
                child: SizedBox(
                  width: 70.0.wp,
                  height: 70.0.wp,
                  child: CircularStepProgressIndicator(
                    totalSteps: createdTasks == 0 ? 1 : createdTasks,
                    currentStep: completedTasks,
                    stepSize: 20,
                    selectedColor: green,
                    unselectedColor: Colors.grey[200],
                    padding: 0,
                    width: 150,
                    height: 150,
                    selectedStepSize: 22,
                    roundedCap: (_, __) => true,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '${createdTasks == 0 ? 0 : percent} %',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0.sp,
                          ),
                        ),
                        SizedBox(
                          height: 1.0.wp,
                        ),
                        Text('Efficiency',
                            style: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.bold,
                                fontSize: 12.0.sp))
                      ],
                    ),
                  ),
                ),
              )
            ]);
          },
        ),
      ),
    );
  }

  Row _buildStatus(Color color, int number, String title) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 3.0.wp,
          width: 3.0.wp,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                width: 0.5.wp,
                color: color,
              )),
        ),
        SizedBox(
          width: 3.0.wp,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('$number',
                style:
                    TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0.sp)),
            SizedBox(
              height: 2.0.wp,
            ),
            Text(
              title,
              style: TextStyle(
                fontSize: 12.0.sp,
                color: Colors.grey,
              ),
            )
          ],
        )
      ],
    );
  }
}
