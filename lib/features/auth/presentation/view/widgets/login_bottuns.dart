import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qent/appnavigator.dart';
import 'package:qent/constants.dart';
import 'package:qent/core/widgets/custom_button.dart';
import 'package:qent/features/auth/presentation/manager/auth%20cubit/auth_cubit.dart';
import 'package:qent/features/auth/presentation/view/signup_view.dart';
import 'package:qent/features/home/presentation/view/home_view.dart';

class login_buttons extends StatelessWidget {
  final TextEditingController emailController;
  final TextEditingController passwordController;

  const login_buttons({
    super.key,
    required this.emailController,
    required this.passwordController,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthSuccess) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => HomeView()),
          );
        }
        if (state is AuthFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.message), backgroundColor: Colors.red),
          );
        }
      },
      builder: (context, state) {
        void onLoginPressed() {
          if (state is! AuthLoading) {
            context.read<AuthCubit>().login(
              email: emailController.text.trim(),
              password: passwordController.text,
            );
          }
        }

        return Column(
          children: [
            CustomButton(
              text: 'Login',
              onpressed: onLoginPressed,
              color: const Color(0xff21292B),
              textColor: Colors.white,
            ),
            const SizedBox(height: 18),
            CustomButton(
              sideColor: Colors.black,
              text: 'Sign Up',
              onpressed: () {
                AppNavigator.goToAndClearStack(context, SignupView());
              },
              color: AppColors.secondaryColor,
              textColor: Colors.black,
            ),
          ],
        );
      },
    );
  }
}
