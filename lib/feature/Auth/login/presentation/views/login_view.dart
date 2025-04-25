import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:to_do_list_app/core/assets/app_image.dart';
import 'package:to_do_list_app/core/helper/snake_bar.dart';
import 'package:to_do_list_app/core/utils/router.dart';
import 'package:to_do_list_app/core/utils/styles.dart';
import 'package:to_do_list_app/core/widgets/app_background.dart';
import 'package:to_do_list_app/core/widgets/check_have_an_account.dart';
import 'package:to_do_list_app/core/widgets/custom_elevated_button.dart';
import 'package:to_do_list_app/feature/Auth/manager/cubit/auth_cubit.dart';
import 'package:to_do_list_app/feature/Auth/register/presentation/views/widgets/custom_text_form_field.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  bool isLoading = false;
  String? email, password;
  GlobalKey<FormState> formKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is LoginLoading) {
          isLoading = true;
        } else if (state is LoginSuccess) {
          GoRouter.of(context).push(Transport.kHomeView);
          isLoading = false;
        } else if (state is LoginFailure) {
          snakeBarShow(context, state.errorMessage);
          isLoading = false;
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: isLoading,
          child: AppBackground(
            child: Form(
              key: formKey,
              child: Center(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Column(
                      children: [
                        const Text('Welcome Back!', style: Styles.textMedium20),
                        const SizedBox(height: 16),
                        const Image(
                          image: AssetImage(Assets.imagesExplaining),
                          fit: BoxFit.fill,
                        ),
                        const SizedBox(height: 16),
                        CustomTextFormField(
                          hintText: 'Enter your Email address',
                          onChanged: (value) {
                            email = value;
                          },
                        ),
                        CustomTextFormField(
                          obscureText: true,
                          hintText: 'Confirm Password',
                          onChanged: (value) {
                            password = value;
                          },
                        ),
                        const SizedBox(height: 40),
                        Text(
                          'Forgot Password ?',
                          style: Styles.textMedium13.copyWith(
                            color: const Color(0xff55847A),
                          ),
                        ),
                        const SizedBox(height: 40),
                        CustomElevatedButton(
                          text: 'Sign In',
                          onPressed: () async {
                            if (formKey.currentState!.validate()) {
                              BlocProvider.of<AuthCubit>(
                                context,
                              ).login(email: email!, password: password!);
                            } else {}
                          },
                        ),
                        const SizedBox(height: 40),
                        CheckHaveAnAccount(
                          onTap: () {
                            GoRouter.of(context).pop();
                          },
                          check: 'Dont have an account ? ',
                          enter: 'Sign Up',
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
