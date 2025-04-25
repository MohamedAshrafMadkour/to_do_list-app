import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:to_do_list_app/core/assets/app_image.dart';
import 'package:to_do_list_app/core/constants/constant.dart';
import 'package:to_do_list_app/core/utils/router.dart';
import 'package:to_do_list_app/core/utils/styles.dart';
import 'package:to_do_list_app/core/widgets/custom_elevated_button.dart';

class CustomSplashViewBody extends StatelessWidget {
  const CustomSplashViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Image(image: AssetImage(Assets.imagesMan), fit: BoxFit.fill),
          const SizedBox(height: 44),
          const Text('Get things done with TODo', style: Styles.textMedium20),
          const SizedBox(height: 32),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 80),
            child: Text(
              kRegardsText,
              style: Styles.textMedium13,
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 70),
          CustomElevatedButton(
            text: 'Get Started',
            onPressed: () {
              GoRouter.of(context).push(Transport.kRegisterView);
            },
          ),
        ],
      ),
    );
  }
}
