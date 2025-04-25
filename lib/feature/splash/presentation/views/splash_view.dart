import 'package:flutter/material.dart';
import 'package:to_do_list_app/core/widgets/app_background.dart';
import 'package:to_do_list_app/feature/splash/presentation/views/widgets/custom_splash_view_body.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return const AppBackground(child: CustomSplashViewBody());
  }
}
