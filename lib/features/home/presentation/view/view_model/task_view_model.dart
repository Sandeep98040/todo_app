
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app/features/home/data/data_source/task_local_data_source.dart';
import 'package:todo_app/features/home/presentation/state/home_state.dart';

final taskServiceProvider = Provider((ref) => TaskService());
final taskListProvider =
    StateNotifierProvider<TaskListNotifier, List<Task>>((ref) {
  final taskService = ref.watch(taskServiceProvider);
  return TaskListNotifier(taskService);
});

class TaskListNotifier extends StateNotifier<List<Task>> {
  final TaskService taskService;

  TaskListNotifier(this.taskService) : super([]) {
    _loadTasks();
  }

  Future<void> _loadTasks() async {
    final tasks = await taskService.getTasks();
    state = tasks;
  }

  void updateTaskStatus(Task task, bool isCompleted) {
    taskService.updateTask(task.copyWith(isCompleted: isCompleted));
    state = [
      for (final t in state)
        if (t.taskId == task.taskId)
          task.copyWith(isCompleted: isCompleted)
        else
          t
    ];
  }
}
