import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_list_app/core/utils/styles.dart';
import 'package:to_do_list_app/feature/home/display/presentation/view/widget/custom_bottom_sheet.dart';
import 'package:to_do_list_app/feature/home/manager/display_task/display_tasks_cubit.dart';

class CustomTasksListHeader extends StatefulWidget {
  const CustomTasksListHeader({super.key});

  @override
  State<CustomTasksListHeader> createState() => _CustomTasksListHeaderState();
}

class _CustomTasksListHeaderState extends State<CustomTasksListHeader> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          'Dairy  Tasks.',
          style: Styles.textMedium15.copyWith(color: Colors.grey),
        ),
        const Spacer(),
        IconButton(
          color: Colors.black,
          onPressed: () {
            BlocProvider.of<DisplayTasksCubit>(context).delete();
          },
          icon: const Icon(Icons.delete, size: 28),
        ),
        IconButton(
          color: Colors.black,
          onPressed: () {
            showModalBottomSheet(
              isScrollControlled: true,
              context: context,
              builder: (context) {
                return const CustomBottomSheet();
              },
            );
          },
          icon: const Icon(Icons.add_circle, size: 28),
        ),
      ],
    );
  }
}
