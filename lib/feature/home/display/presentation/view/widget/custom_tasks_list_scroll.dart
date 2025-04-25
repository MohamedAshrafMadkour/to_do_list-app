import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_list_app/core/utils/styles.dart';
import 'package:to_do_list_app/feature/home/data/model/task_model.dart';
import 'package:to_do_list_app/feature/home/display/presentation/view/widget/custom_list_tile.dart';
import 'package:to_do_list_app/feature/home/manager/display_task/display_tasks_cubit.dart';

class CustomTasksList extends StatefulWidget {
  const CustomTasksList({super.key});

  @override
  State<CustomTasksList> createState() => _CustomTasksListState();
}

class _CustomTasksListState extends State<CustomTasksList> {
  @override
  void initState() {
    BlocProvider.of<DisplayTasksCubit>(context).display();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DisplayTasksCubit, DisplayTasksState>(
      builder: (context, state) {
        List<TaskModel> task =
            BlocProvider.of<DisplayTasksCubit>(context).task ?? [];
        if (task.isEmpty) {
          return Center(
            child: Text(
              'No tasks Today!',
              style: Styles.textMedium15.copyWith(color: Colors.grey),
            ),
          );
        }
        return IntrinsicHeight(
          child: Column(
            children: List.generate(task.length, (index) {
              return Padding(
                padding: const EdgeInsets.only(left: 18),
                child: CustomListTile(task: task[index]),
              );
            }),
          ),
        );
      },
    );
  }
}
