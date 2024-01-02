class Task {
  final int taskId;
  final String taskName;
   bool isCompleted;

  Task({required this.taskId, required this.taskName, this.isCompleted = false});

  Task copyWith({int? taskId, String? taskName, bool? isCompleted}) {
    return Task(
      taskId: taskId ?? this.taskId,
      taskName: taskName ?? this.taskName,
      isCompleted: isCompleted ?? this.isCompleted,
    );
  }
}
