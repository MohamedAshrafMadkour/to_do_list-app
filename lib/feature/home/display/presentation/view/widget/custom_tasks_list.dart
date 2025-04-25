import 'package:flutter/material.dart';
import 'package:to_do_list_app/core/utils/styles.dart';
import 'package:to_do_list_app/feature/home/display/presentation/view/widget/custom_single_scroll_view.dart';

class CustomTasksListSection extends StatelessWidget {
  const CustomTasksListSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 24, right: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Todo  Tasks.', style: Styles.textMedium20),
          const SizedBox(height: 16),
          AspectRatio(
            aspectRatio: 3.8 / 2.5,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24),
                color: const Color(0xffFFFFFF),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade300,
                    blurRadius: 8,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: const Padding(
                padding: EdgeInsets.only(bottom: 16),
                child: CustomSingleScrollView(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
