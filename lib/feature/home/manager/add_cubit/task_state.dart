abstract class TasksState {}

class TasksInitial extends TasksState {}

class TasksLoading extends TasksState {}

class TasksLoaded extends TasksState {}

class TasksError extends TasksState {
  final String message;

  TasksError(this.message);
}
