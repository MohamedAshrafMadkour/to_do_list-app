import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:to_do_list_app/core/constants/constant.dart';
import 'package:to_do_list_app/core/utils/router.dart';
import 'package:to_do_list_app/feature/Auth/manager/cubit/auth_cubit.dart';
import 'package:to_do_list_app/feature/home/data/model/task_model.dart';
import 'package:to_do_list_app/feature/home/manager/add_cubit/tasks_cubit.dart';
import 'package:to_do_list_app/feature/home/manager/display_task/display_tasks_cubit.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await Hive.initFlutter();
  Hive.registerAdapter(TaskModelAdapter());
  await Hive.openBox<TaskModel>(kBox);
  runApp(const ToDoListApp());
}

class ToDoListApp extends StatelessWidget {
  const ToDoListApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AuthCubit()),
        BlocProvider(create: (context) => TasksCubit()),
        BlocProvider(create: (context) => DisplayTasksCubit()),
      ],
      child: MaterialApp.router(
        routerConfig: Transport.router,
        theme: ThemeData.light().copyWith(
          textTheme: ThemeData.light().textTheme.apply(fontFamily: 'Poppins'),
          scaffoldBackgroundColor: const Color(0xffEDEDED),
        ),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
