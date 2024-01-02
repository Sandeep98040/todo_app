// import 'package:flutter/material.dart';
// import 'package:todo_app/features/home/data/data_source/task_local_data_source.dart';
// import 'package:todo_app/features/home/presentation/state/home_state.dart';

// class HomeView extends StatefulWidget {
//   const HomeView({super.key});

//   @override
//   _HomeViewState createState() => _HomeViewState();
// }

// class _HomeViewState extends State<HomeView> {
//   final TaskService taskService = TaskService();

//   @override
//   Widget build(BuildContext context) {
//     return DefaultTabController(
//       length: 3,
//       child: Scaffold(
//         appBar: AppBar(
//           bottom: const TabBar(
//             tabs: [
//               Tab(text: 'All'),
//               Tab(text: 'Completed'),
//               Tab(text: 'Incomplete'),
//             ],
//           ),
//           title: const Text('To-Do App'),
//         ),
//         body: TabBarView(
//           children: [
//             _buildTaskList(taskService.tasks),
//             _buildTaskList(
//                 taskService.tasks.where((t) => t.isCompleted).toList()),
//             _buildTaskList(
//                 taskService.tasks.where((t) => !t.isCompleted).toList()),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildTaskList(List<Task> tasks) {
//     return ListView.builder(
//       itemCount: tasks.length,
//       itemBuilder: (context, index) {
//         final task = tasks[index];
//         return CheckboxListTile(
//           title: Text(task.taskName),
//           value: task.isCompleted,
//           onChanged: (bool? newValue) {
//             setState(() {
//               task.isCompleted = newValue!;
//             });
//           },
//         );
//       },
//     );
//   }
// }
// import 'package:flutter/material.dart';
// import 'package:todo_app/features/home/data/data_source/task_local_data_source.dart';
// import 'package:todo_app/features/home/presentation/state/home_state.dart';

// class HomeView extends StatefulWidget {
//   const HomeView({Key? key}) : super(key: key);

//   @override
//   _HomeViewState createState() => _HomeViewState();
// }

// class _HomeViewState extends State<HomeView> {
//   final TaskService taskService = TaskService();

//   @override
//   Widget build(BuildContext context) {
//     return DefaultTabController(
//       length: 3,
//       child: Scaffold(
//         appBar: AppBar(
//           title: const Text('To-Do App'),
//           bottom: const TabBar(
//             indicatorColor: Colors.white,
//             tabs: [
//               Tab(icon: Icon(Icons.list), text: 'All'),
//               Tab(icon: Icon(Icons.check_circle_outline), text: 'Completed'),
//               Tab(icon: Icon(Icons.radio_button_unchecked), text: 'Incomplete'),
//             ],
//           ),
//         ),
//         body: TabBarView(
//           children: [
//             _buildTaskList(taskService.tasks),
//             _buildTaskList(taskService.tasks.where((t) => t.isCompleted).toList()),
//             _buildTaskList(taskService.tasks.where((t) => !t.isCompleted).toList()),
//           ],
//         ),
//         floatingActionButton: FloatingActionButton(
//           onPressed: () => _addNewTask(),
//           child: const Icon(Icons.add),
//           backgroundColor: Colors.blue,
//         ),
//       ),
//     );
//   }

//   Widget _buildTaskList(List<Task> tasks) {
//     return ListView.separated(
//       padding: const EdgeInsets.all(8),
//       itemCount: tasks.length,
//       separatorBuilder: (context, index) => const Divider(),
//       itemBuilder: (context, index) {
//         final task = tasks[index];
//         return ListTile(
//           title: Text(task.taskName, style: TextStyle(
//             decoration: task.isCompleted ? TextDecoration.lineThrough : null)),
//           trailing: Checkbox(
//             value: task.isCompleted,
//             onChanged: (bool? newValue) {
//               setState(() {
//                 task.isCompleted = newValue!;
//               });
//             },
//           ),
//           onTap: () => _toggleTaskCompletion(task),
//         );
//       },
//     );
//   }

//   void _toggleTaskCompletion(Task task) {
//     setState(() {
//       task.isCompleted = !task.isCompleted;
//     });
//   }

//   void _addNewTask() {
//   }
// }
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app/features/home/presentation/state/home_state.dart';
import 'package:todo_app/features/home/presentation/view/view_model/task_view_model.dart';

class HomeView extends ConsumerWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final allTasks = ref.watch(taskListProvider);
    final completedTasks = allTasks.where((t) => t.isCompleted).toList();
    final incompleteTasks = allTasks.where((t) => !t.isCompleted).toList();

    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('To-Do App'),
          bottom: const TabBar(
            indicatorColor: Colors.white,
            tabs: [
              Tab(icon: Icon(Icons.list), text: 'All'),
              Tab(icon: Icon(Icons.check_circle_outline), text: 'Completed'),
              Tab(icon: Icon(Icons.radio_button_unchecked), text: 'Incomplete'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            _buildTaskList(context, ref, allTasks),
            _buildTaskList(context, ref, completedTasks),
            _buildTaskList(context, ref, incompleteTasks),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => _addNewTask(context, ref),
          backgroundColor: Colors.blue,
          child: const Icon(Icons.add),
        ),
      ),
    );
  }

  Widget _buildTaskList(BuildContext context, WidgetRef ref, List<Task> tasks) {
    return ListView.separated(
      padding: const EdgeInsets.all(8),
      itemCount: tasks.length,
      separatorBuilder: (context, index) => const Divider(),
      itemBuilder: (context, index) {
        final task = tasks[index];
        return ListTile(
          title: Text(task.taskName,
              style: TextStyle(
                  decoration:
                      task.isCompleted ? TextDecoration.lineThrough : null)),
          trailing: Checkbox(
            value: task.isCompleted,
            onChanged: (bool? newValue) {
              ref
                  .read(taskListProvider.notifier)
                  .updateTaskStatus(task, newValue!);
            },
          ),
          onTap: () => _toggleTaskCompletion(ref, task),
        );
      },
    );
  }

  void _toggleTaskCompletion(WidgetRef ref, Task task) {
    ref
        .read(taskListProvider.notifier)
        .updateTaskStatus(task, !task.isCompleted);
  }

  void _addNewTask(BuildContext context, WidgetRef ref) {
    // Logic to add a new task
  }
}
