import 'package:bloc/bloc.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';
import 'package:to_do_list_app/core/constants/constant.dart';
import 'package:to_do_list_app/feature/home/data/model/task_model.dart';

part 'display_tasks_state.dart';

class DisplayTasksCubit extends Cubit<DisplayTasksState> {
  DisplayTasksCubit() : super(DisplayTasksInitial());
  List<TaskModel>? task;
  display() {
    var taskBox = Hive.box<TaskModel>(kBox);
    task = taskBox.values.toList();
    emit(DisplayTasksSuccess());
  }

  delete() {
    var taskBox = Hive.box<TaskModel>(kBox);
    taskBox.clear();
    task!.clear();
    emit(DisplayTasksSuccess());
  }
}
