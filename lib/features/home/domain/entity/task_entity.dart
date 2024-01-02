// import 'package:equatable/equatable.dart';

// class TaskEntity extends Equatable {
//   final String? taskId;
//   final String taskName;
//   final bool isCompleted;

//   @override
//   List<Object?> get props => [taskId, taskName, isCompleted];

//   const TaskEntity({
//     this.taskId,
//     required this.taskName,
//     required this.isCompleted
//   });

//   factory TaskEntity.fromJson(Map<String, dynamic> json) => TaskEntity(
//         taskId: json["taskId"],
//         taskName: json["taskName"],
//         isCompleted: json["isCompleted"]
//       );

//   Map<String, dynamic> toJson() => {
//         "taskId": taskId,
//         "taskName": taskName,
//         "isCompleted": isCompleted,
//       };

//   @override
//   String toString() {
//     return 'TaskEntity(taskId: $taskId, taskName: $taskName, isCompleted: $isCompleted)';
//   }
// }