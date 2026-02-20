import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qent/appnavigator.dart';
import 'package:qent/constants.dart';
import 'package:qent/core/widgets/custom_button.dart';
import 'package:qent/features/auth/data/services/auth_service.dart';
import 'package:qent/features/auth/presentation/manager/auth%20cubit/auth_cubit.dart';
import 'package:qent/features/auth/presentation/view/login_view.dart';
import 'package:qent/features/auth/presentation/view/signup_view.dart';
import 'package:qent/features/auth/presentation/view/widgets/custom_text_field.dart';

class NewPasswordView extends StatefulWidget {
  final String resetCode;
  final String resetToken; // ✅

  const NewPasswordView({
    super.key,
    required this.resetCode,
    required this.resetToken,
  });

  @override
  State<NewPasswordView> createState() => _NewPasswordViewState();
}

class _NewPasswordViewState extends State<NewPasswordView> {
  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  @override
  void dispose() {
    newPasswordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => AuthCubit(AuthService()),
      child: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is AuthSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Password reset successfully!'),
                backgroundColor: Colors.green,
              ),
            );
            AppNavigator.goToAndClearStack(context, LoginView());
          }
          if (state is AuthFailure) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.message),
                backgroundColor: Colors.red,
              ),
            );
          }
        },
        builder: (context, state) {
          return Scaffold(
            body: Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(
                    'assets/images/black_logo.png',
                    width: 100,
                    height: 100,
                  ),
                  Spacer(),
                  Center(
                    child: Text(
                      'New Password',
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(height: 28),
                  CustomTextField(
                    controller: newPasswordController,
                    hint: 'New Password',
                  ),
                  SizedBox(height: 16),
                  CustomTextField(
                    controller: confirmPasswordController,
                    hint: 'Confirm New Password',
                  ),
                  SizedBox(height: 16),
                  CustomButton(
                    text: state is AuthLoading ? 'Saving...' : 'Continue',
                    onpressed: state is AuthLoading
                        ? () {}
                        : () {
                            if (newPasswordController.text.isEmpty ||
                                confirmPasswordController.text.isEmpty) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text('Please fill all fields'),
                                ),
                              );
                              return;
                            }
                            if (newPasswordController.text !=
                                confirmPasswordController.text) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text('Passwords do not match'),
                                  backgroundColor: Colors.red,
                                ),
                              );
                              return;
                            }
                            context.read<AuthCubit>().resetPassword(
                              code: widget.resetCode, // ✅
                              newPassword: newPasswordController.text,
                              confirmPassword: confirmPasswordController.text,
                              resetToken: widget.resetToken, // ✅
                            );
                          },
                    color: AppColors.btn_color,
                    textColor: Colors.white,
                  ),
                  Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Create a  ', style: TextStyle(color: Colors.grey)),
                      GestureDetector(
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) => SignupView()),
                        ),
                        child: Text(
                          'New account',
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 28),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
