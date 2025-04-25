import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:to_do_list_app/core/helper/snake_bar.dart';
import 'package:to_do_list_app/core/utils/router.dart';
import 'package:to_do_list_app/core/utils/styles.dart';
import 'package:to_do_list_app/core/widgets/app_background.dart';
import 'package:to_do_list_app/core/widgets/check_have_an_account.dart';
import 'package:to_do_list_app/core/widgets/custom_elevated_button.dart';
import 'package:to_do_list_app/feature/Auth/manager/cubit/auth_cubit.dart';
import 'package:to_do_list_app/feature/Auth/register/presentation/views/widgets/custom_text_form_field.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  String? userName, email, password, confirmPassword;
  bool isLoading = false;
  GlobalKey<FormState> formKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is RegisterLoading) {
          setState(() {
            isLoading = true;
          });
        } else if (state is RegisterSuccess) {
          GoRouter.of(context).push(Transport.kLoginView);
          setState(() {
            isLoading = false;
          });
        } else if (state is RegisterFailure) {
          snakeBarShow(context, state.errorMessage);
          setState(() {
            isLoading = false;
          });
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: isLoading,
          child: AppBackground(
            child: Form(
              key: formKey,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Center(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        const Text(
                          'Welcome Onboard!',
                          style: Styles.textMedium20,
                        ),
                        const SizedBox(height: 24),
                        Text(
                          'Let’s help you meet up your task',
                          style: Styles.textMedium13.copyWith(
                            color: const Color(0xff55847A),
                          ),
                        ),
                        const SizedBox(height: 55),
                        CustomTextFormField(
                          hintText: 'Enter your Full Name',
                          onChanged: (value) {
                            userName = value;
                          },
                        ),
                        CustomTextFormField(
                          hintText: 'Enter your Email address',
                          onChanged: (value) {
                            email = value;
                          },
                        ),
                        CustomTextFormField(
                          obscureText: true,
                          hintText: 'Create a Password',
                          onChanged: (value) {
                            password = value;
                          },
                        ),
                        CustomTextFormField(
                          obscureText: true,
                          hintText: 'Confirm your Password',
                          onChanged: (value) {
                            confirmPassword = value;
                          },
                        ),
                        const SizedBox(height: 65),
                        CustomElevatedButton(
                          text: 'Sign Up',
                          onPressed: () async {
                            if (formKey.currentState!.validate()) {
                              BlocProvider.of<AuthCubit>(context).register(
                                name: userName!,
                                email: email!,
                                password: password!,
                                confirmPassword: confirmPassword!,
                              );
                            } else {}
                          },
                        ),
                        const SizedBox(height: 65),
                        CheckHaveAnAccount(
                          onTap: () {
                            GoRouter.of(context).push(Transport.kLoginView);
                          },
                          check: 'Already have an account ?',
                          enter: ' Sign In ',
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
