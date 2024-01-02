// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:hive_flutter/hive_flutter.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:todo_app/config/constants/hive_table_constants.dart';
// import 'package:todo_app/features/home/data/model/task_hive_model.dart';

// final hiveServiceProvider = Provider<HiveService>((ref) => HiveService());

// class HiveService {
//   Future<void> init() async {
//     final directory = await getApplicationDocumentsDirectory();
//     Hive.init(directory.path);

//     // Register Adapters
//     Hive.registerAdapter(
//         TaskHiveModelAdapter()); // Assuming you have this adapter
//     // ... register other adapters
//   }

//   // ======================== Task Queries ========================
//   Future<void> addTask(TaskHiveModel task) async {
//     final box = await Hive.openBox<TaskHiveModel>(HiveTableConstant.taskBox);
//     await box.put(task.taskId, task);
//   }

//   Future<List<TaskHiveModel>> getAllTasks() async {
//     final box = await Hive.openBox<TaskHiveModel>(HiveTableConstant.taskBox);
//     return box.values.toList();
//   }

//   Future<void> deleteTask(String taskId) async {
//     final box = await Hive.openBox<TaskHiveModel>(HiveTableConstant.taskBox);
//     await box.delete(taskId);
//   }

//   // ======================== Other Queries ========================
//   // ... keep other entity methods (Batch, Course, Auth)

//   // Delete hive for Task
//   Future<void> deleteTaskHive() async {
//     await Hive.deleteBoxFromDisk(HiveTableConstant.taskBox);
//   }

//   // ... keep other delete methods (Batch, Course, Auth)
// }
