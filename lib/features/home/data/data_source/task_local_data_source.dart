// import 'package:dartz/dartz.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:todo_app/core/failure/failure.dart';
// import 'package:todo_app/core/network/hive_service.dart';
// import 'package:todo_app/features/home/data/model/task_hive_model.dart';
// import 'package:todo_app/features/home/domain/entity/task_entity.dart';

// final taskLocalDataSourceProvider = Provider.autoDispose<TaskLocalDataSource>(
//   (ref) => TaskLocalDataSource(
//     hiveService: ref.read(hiveServiceProvider),
//   ),
// );

// class TaskLocalDataSource {
//   final HiveService hiveService;

//   TaskLocalDataSource({
//     required this.hiveService,
//   });

//   // Add Task
//   Future<Either<Failure, bool>> addTask(TaskEntity task) async {
//     try {
//       // Convert TaskEntity to TaskHiveModel
//       TaskHiveModel taskHiveModel =
//           TaskHiveModel.fromEntity(task); // Assuming this method exists
//       await hiveService.addTask(taskHiveModel); // Make sure to await the result
//       return const Right(true);
//     } catch (e) {
//       return Left(Failure(error: e.toString()));
//     }
//   }

//   // Get All Tasks
//   Future<Either<Failure, List<TaskEntity>>> getAllTasks() async {
//     try {
//       List<TaskHiveModel> taskHiveModels =
//           await hiveService.getAllTasks(); // Assuming this method exists
//       // Convert Hive Object to Entity
//       List<TaskEntity> taskEntities = taskHiveModels
//           .map((e) => TaskHiveModel.toEntity(e))
//           .toList(); // Assuming this static method exists
//       return Right(taskEntities);
//     } catch (e) {
//       return Left(Failure(error: e.toString()));
//     }
//   }

import 'package:todo_app/features/home/presentation/state/home_state.dart';

class TaskService {
  List<Task> tasks = [
    Task(taskId: 1, taskName: 'Cycling', isCompleted: true),
    Task(taskId: 2, taskName: 'Football', isCompleted: false),
    Task(taskId: 3, taskName: 'Flutter', isCompleted: true),
    Task(taskId: 4, taskName: 'Web Api', isCompleted: true),
    Task(taskId: 5, taskName: 'Work', isCompleted: false),
  ];

  // Method to retrieve all tasks
  Future<List<Task>> getTasks() async {
    return tasks;
  }

  // Method to update a task
  void updateTask(Task updatedTask) {
    int index = tasks.indexWhere((task) => task.taskId == updatedTask.taskId);
    if (index != -1) {
      tasks[index] = updatedTask;
    }
  }
}
