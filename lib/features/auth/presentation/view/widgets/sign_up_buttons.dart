import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qent/appnavigator.dart';
import 'package:qent/constants.dart';
import 'package:qent/core/widgets/custom_button.dart';
import 'package:qent/features/auth/presentation/manager/auth%20cubit/auth_cubit.dart';
import 'package:qent/features/auth/presentation/view/login_view.dart';
import 'package:qent/features/auth/presentation/view/verify_phone_view.dart';

class signup_buttons extends StatelessWidget {
  final TextEditingController fullNameController;
  final TextEditingController emailController;
  final TextEditingController phoneController;
  final TextEditingController passwordController;
  final TextEditingController country_id_Controller;
  final TextEditingController location_id_Controller;

  const signup_buttons({
    super.key,
    required this.fullNameController,
    required this.emailController,
    required this.phoneController,
    required this.passwordController,
    required this.country_id_Controller,
    required this.location_id_Controller,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthSuccess) {
          AppNavigator.goToAndClearStack(
            context,
            VerifyPhoneView(phone: phoneController.text.trim()),
          );
        }
        if (state is AuthFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.message), backgroundColor: Colors.red),
          );
        }
      },

      builder: (context, state) {
        void onSignUpPressed() {
          if (state is! AuthLoading) {
            context.read<AuthCubit>().register(
              fullName: fullNameController.text.trim(),
              email: emailController.text.trim(),
              phone: phoneController.text.trim(),
              password: passwordController.text,
              country: int.tryParse(country_id_Controller.text.trim()) ?? 1,
              location: int.tryParse(location_id_Controller.text.trim()) ?? 6,
            );
          }
        }

        return Column(
          children: [
            CustomButton(
              text: 'Sign Up',
              onpressed: () {
                onSignUpPressed();
              },
              color: Color(0xff21292B),
              textColor: Colors.white,
            ),
            SizedBox(height: 18),
            CustomButton(
              sideColor: Colors.black,
              text: 'Login',
              onpressed: () {
                AppNavigator.goToAndClearStack(context, LoginView());
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
