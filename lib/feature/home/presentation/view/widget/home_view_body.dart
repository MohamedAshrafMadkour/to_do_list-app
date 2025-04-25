import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:to_do_list_app/core/assets/app_image.dart';
import 'package:to_do_list_app/core/utils/router.dart';
import 'package:to_do_list_app/core/utils/styles.dart';
import 'package:to_do_list_app/core/widgets/app_background.dart';
import 'package:to_do_list_app/core/widgets/custom_elevated_button.dart';
import 'package:to_do_list_app/core/widgets/custom_task_text_form_field.dart';
import 'package:to_do_list_app/feature/home/manager/add_cubit/task_state.dart';
import 'package:to_do_list_app/feature/home/manager/add_cubit/tasks_cubit.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({super.key});

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  String? task1, task2, task3;
  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;
  GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return AppBackground(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: SingleChildScrollView(
          child: SafeArea(
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: IconButton(
                      onPressed: () {
                        GoRouter.of(context).pop();
                      },
                      icon: const Image(
                        image: AssetImage(Assets.imagesBackArrow),
                      ),
                    ),
                  ),
                  const SizedBox(height: 50),
                  const Text("Welcome Onboard!", style: Styles.textMedium20),
                  const SizedBox(height: 50),
                  const Image(image: AssetImage(Assets.imagesLaptop)),
                  const SizedBox(height: 30),
                  Text(
                    'Add What your want to do later on..',
                    style: Styles.textMedium13.copyWith(
                      color: const Color(0xff55847A),
                    ),
                  ),
                  const SizedBox(height: 30),
                  CustomTaskTextFormField(
                    autovalidateMode: autoValidateMode,
                    onChanged: (value) => task1 = value,
                  ),
                  CustomTaskTextFormField(
                    autovalidateMode: autoValidateMode,
                    onChanged: (value) => task2 = value,
                  ),
                  CustomTaskTextFormField(
                    autovalidateMode: autoValidateMode,
                    onChanged: (value) => task3 = value,
                  ),
                  BlocBuilder<TasksCubit, TasksState>(
                    builder: (context, state) {
                      return state is TasksLoading
                          ? const CircularProgressIndicator()
                          : CustomElevatedButton(
                            text: 'Add to list',
                            onPressed: () {
                              if (formKey.currentState!.validate()) {
                                formKey.currentState!.save();
                                final cubit = context.read<TasksCubit>();

                                if (task1?.isNotEmpty == true) {
                                  cubit.addTask(title: task1!);
                                }
                                if (task2?.isNotEmpty == true) {
                                  cubit.addTask(title: task2!);
                                }
                                if (task3?.isNotEmpty == true) {
                                  cubit.addTask(title: task3!);
                                }
                                task1 = task2 = task3 = null;
                                formKey.currentState!.reset();
                                FocusScope.of(context).unfocus();
                                GoRouter.of(
                                  context,
                                ).push(Transport.kDisplayView);
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
        ),
      ),
    );
  }
}
