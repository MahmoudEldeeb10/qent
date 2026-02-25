import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qent/appnavigator.dart';
import 'package:qent/constants.dart';
import 'package:qent/core/widgets/custom_button.dart';
import 'package:qent/features/auth/presentation/manager/auth%20cubit/auth_cubit.dart';
import 'package:qent/features/auth/presentation/manager/dropdown_cubit/dropdown_cubit.dart';
import 'package:qent/features/auth/presentation/view/login_view.dart';
import 'package:qent/features/auth/presentation/view/verify_phone_view.dart';

class signup_buttons extends StatelessWidget {
  final TextEditingController fullNameController;
  final TextEditingController emailController;
  final TextEditingController phoneController;
  final TextEditingController passwordController;

  const signup_buttons({
    super.key,
    required this.fullNameController,
    required this.emailController,
    required this.phoneController,
    required this.passwordController,
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
            // Read IDs directly from DropdownCubit
            final dropdownState = context.read<DropdownCubit>().state;

            if (dropdownState is! DropdownLoaded ||
                dropdownState.selectedCountry == null ||
                dropdownState.selectedLocation == null) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Please select a country and location'),
                  backgroundColor: Colors.red,
                ),
              );
              return;
            }

            context.read<AuthCubit>().register(
              fullName: fullNameController.text.trim(),
              email: emailController.text.trim(),
              phone: phoneController.text.trim(),
              password: passwordController.text,
              country: dropdownState.selectedCountry!.id,
              location: dropdownState.selectedLocation!.id,
            );
          }
        }

        return Column(
          children: [
            CustomButton(
              text: 'Sign Up',
              onpressed: onSignUpPressed,
              color: const Color(0xff21292B),
              textColor: Colors.white,
            ),
            const SizedBox(height: 18),
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
