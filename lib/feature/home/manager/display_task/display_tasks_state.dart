part of 'display_tasks_cubit.dart';

@immutable
sealed class DisplayTasksState {}

final class DisplayTasksInitial extends DisplayTasksState {}

final class DisplayTasksSuccess extends DisplayTasksState {}
