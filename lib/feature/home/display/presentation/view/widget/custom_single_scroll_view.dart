import 'package:flutter/material.dart';
import 'package:to_do_list_app/feature/home/display/presentation/view/widget/custom_tasks_list_header_section.dart';
import 'package:to_do_list_app/feature/home/display/presentation/view/widget/custom_tasks_list_scroll.dart';

class CustomSingleScrollView extends StatelessWidget {
  const CustomSingleScrollView({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 25),
            child: CustomTasksListHeader(),
          ),
          CustomTasksList(),
        ],
      ),
    );
  }
}
