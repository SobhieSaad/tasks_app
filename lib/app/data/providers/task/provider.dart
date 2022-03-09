import 'dart:convert';

import 'package:get/get.dart';
import 'package:tasks_app/app/core/utils/keys.dart';
import 'package:tasks_app/app/data/models/task.dart';
import 'package:tasks_app/app/data/services/storage/services.dart';

class TaskProvider {
  StorageService storage = Get.find<StorageService>();

  List<Task> readTasks() {
    var tasks = <Task>[];
    jsonDecode(storage.read(taskKey).toString())
        .forEach((e) => tasks.add(Task.fromJson(e)));

    return tasks;
  }
}
