import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:to_do_list_app/core/helper/snake_bar.dart';
import 'package:to_do_list_app/core/widgets/custom_elevated_button.dart';
import 'package:to_do_list_app/core/widgets/custom_task_text_form_field.dart';
import 'package:to_do_list_app/feature/home/manager/add_cubit/task_state.dart';
import 'package:to_do_list_app/feature/home/manager/add_cubit/tasks_cubit.dart';
import 'package:to_do_list_app/feature/home/manager/display_task/display_tasks_cubit.dart';

class CustomBottomSheet extends StatefulWidget {
  const CustomBottomSheet({super.key});

  @override
  State<CustomBottomSheet> createState() => _CustomBottomSheetState();
}

class _CustomBottomSheetState extends State<CustomBottomSheet> {
  String? task;
  GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 24,
        right: 24,
        top: 24,
        bottom: MediaQuery.of(context).viewInsets.bottom + 48,
      ),
      child: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(
            children: [
              CustomTaskTextFormField(
                onChanged: (value) {
                  task = value;
                },
              ),
              BlocBuilder<TasksCubit, TasksState>(
                builder: (context, state) {
                  return state is TasksLoading
                      ? const Center(child: CircularProgressIndicator())
                      : CustomElevatedButton(
                        text: 'Add another task',
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            formKey.currentState!.save();
                            final cubit = context.read<TasksCubit>();
                            if (task?.isNotEmpty == true) {
                              cubit.addTask(title: task!);
                            }
                            GoRouter.of(context).pop();
                            snakeBarShow(context, 'Success');
                            BlocProvider.of<DisplayTasksCubit>(
                              context,
                            ).display();
                          } else {
                            autoValidateMode = AutovalidateMode.always;
                            setState(() {});
                          }
                        },
                      );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
