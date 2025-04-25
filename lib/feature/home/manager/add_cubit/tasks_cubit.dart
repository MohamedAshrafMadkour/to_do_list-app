import 'package:bloc/bloc.dart';
import 'package:hive/hive.dart';
import 'package:to_do_list_app/core/constants/constant.dart';
import 'package:to_do_list_app/feature/home/data/model/task_model.dart';
import 'package:to_do_list_app/feature/home/manager/add_cubit/task_state.dart';

class TasksCubit extends Cubit<TasksState> {
  TasksCubit() : super(TasksInitial());

  void addTask({required String title}) async {
    final task = TaskModel(task: title);
    emit(TasksLoading());
    try {
      var taskBox = Hive.box<TaskModel>(kBox);
      await taskBox.add(task);
      emit(TasksLoaded());
    } catch (e) {
      emit(TasksError(e.toString()));
    }
  }
}
