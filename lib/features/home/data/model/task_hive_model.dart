// // import 'package:hive_flutter/hive_flutter.dart';
// // import 'package:todo_app/config/constants/hive_table_constants.dart';
// // import 'package:todo_app/features/home/domain/entity/task_entity.dart';
// // import 'package:uuid/uuid.dart';

// // part 'task_hive_model.g.dart'; // Ensure this is uncommented

// // @HiveType(typeId: HiveTableConstant.taskTableId) // Ensure this typeId is a valid int
// // class TaskHiveModel extends HiveObject {
// //   @HiveField(0)
// //   final String taskId;

// //   @HiveField(1)
// //   final String taskName;

// //   @HiveField(2)
// //   final bool isCompleted;

// //   // empty constructor
// //   TaskHiveModel.empty() : this(taskId: '', taskName: '', isCompleted: false);

// //   TaskHiveModel({
// //     String? taskId,
// //     required this.taskName,
// //     required this.isCompleted,
// //   }) : taskId = taskId ?? Uuid().v4(); // Removed the const keyword

// //   // Convert Entity to Hive Object
// //   factory TaskHiveModel.fromEntity(TaskEntity entity) => TaskHiveModel(
// //         taskId: entity.taskId, // Add taskId for consistency
// //         taskName: entity.taskName,
// //         isCompleted:entity.isCompleted,
// //       );

// //   // Convert Hive Object to Entity
// //   TaskEntity toEntity() => TaskEntity(
// //         taskId: this.taskId,
// //         taskName: this.taskName,
// //         isCompleted: this.isCompleted,
// //       );

// //   @override
// //   String toString() {
// //     return 'TaskId: $taskId, TaskName: $taskName, IsCompleted: $isCompleted';
// //   }
// // }
// class Task {
//   final int taskId;
//   final String taskName;
//   bool isCompleted;
 
//   Task({required this.taskId, required this.taskName, this.isCompleted = false});
// }