// import 'package:dartz/dartz.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:todo_app/core/failure/failure.dart';
// import 'package:todo_app/features/home/data/repository/task_local_repository_impl.dart';
// import 'package:todo_app/features/home/domain/entity/task_entity.dart';

// final taskRepositoryProvider = Provider.autoDispose<ITaskRepository>((ref) {

//     return ref.read(taskLocalRepositoryProvider);
//   }
// );

// abstract class ITaskRepository {
//   Future<Either<Failure, List<TaskEntity>>> getAllTasks();
//   Future<Either<Failure, bool>> addTask(TaskEntity task);

// }
