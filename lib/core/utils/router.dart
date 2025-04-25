import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:to_do_list_app/feature/Auth/register/presentation/views/register_view.dart';
import 'package:to_do_list_app/feature/Auth/login/presentation/views/login_view.dart';
import 'package:to_do_list_app/feature/home/display/presentation/view/display_view.dart';
import 'package:to_do_list_app/feature/home/presentation/view/home_view.dart';
import 'package:to_do_list_app/feature/splash/presentation/views/splash_view.dart';

abstract class Transport {
  static const kLoginView = '/loginView';
  static const kHomeView = '/homeView';
  static const kDisplayView = '/displayView';
  static const kRegisterView = '/registerView';
  static final GoRouter router = GoRouter(
    routes: <RouteBase>[
      GoRoute(
        path: '/',
        builder: (BuildContext context, GoRouterState state) {
          return const SplashView();
        },
      ),
      GoRoute(
        path: kHomeView,
        builder: (BuildContext context, GoRouterState state) {
          return const HomeView();
        },
      ),
      GoRoute(
        path: kDisplayView,
        builder: (BuildContext context, GoRouterState state) {
          return const DisplayView();
        },
      ),
      GoRoute(
        path: kRegisterView,
        builder: (BuildContext context, GoRouterState state) {
          return const RegisterView();
        },
      ),
      GoRoute(
        path: kLoginView,
        builder: (BuildContext context, GoRouterState state) {
          return const LoginView();
        },
      ),
    ],
  );
}
