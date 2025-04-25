import 'package:flutter/material.dart';
import 'package:to_do_list_app/core/assets/app_image.dart';
import 'package:to_do_list_app/core/widgets/app_background.dart';
import 'package:to_do_list_app/feature/home/display/presentation/view/widget/custom_display_header_section.dart';
import 'package:to_do_list_app/feature/home/display/presentation/view/widget/custom_tasks_list.dart';

class DisplayViewBody extends StatelessWidget {
  const DisplayViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const AppBackground(
      child: Column(
        children: [
          CustomDisplayHeaderSection(),
          Image(image: AssetImage(Assets.imagesCycle), fit: BoxFit.cover),
          CustomTasksListSection(),
        ],
      ),
    );
  }
}
