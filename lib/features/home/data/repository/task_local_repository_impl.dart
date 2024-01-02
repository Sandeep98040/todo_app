// import 'package:dartz/dartz.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:todo_app/core/failure/failure.dart';
// import 'package:todo_app/features/home/data/data_source/task_local_data_source.dart';
// import 'package:todo_app/features/home/domain/entity/task_entity.dart';
// import 'package:todo_app/features/home/domain/repository/task_repository.dart';

// final taskLocalRepositoryProvider = Provider.autoDispose<ITaskRepository>(
//   (ref) => TaskLocalRepositoryImpl(
//       taskLocalDataSource: ref.read(taskLocalDataSourceProvider)),
// );

// class TaskLocalRepositoryImpl implements ITaskRepository {
//   final TaskLocalDataSource taskLocalDataSource;

//   TaskLocalRepositoryImpl({
//     required this.taskLocalDataSource,
//   });

//   @override
//   Future<Either<Failure, bool>> addTask(TaskEntity task) {
//     return taskLocalDataSource.addTask(task);
//   }

//   @override
//   Future<Either<Failure, List<TaskEntity>>> getAllTasks() {
//     return taskLocalDataSource.getAllTasks();
//   }

//   // Implement other task-related methods as needed
// }
