import 'package:flutter/material.dart';
import 'package:qent/features/auth/presentation/view/widgets/custom_text_field.dart';

class LoginTextFields extends StatelessWidget {
  final TextEditingController emailController;
  final TextEditingController passwordController;

  const LoginTextFields({
    super.key,
    required this.emailController,
    required this.passwordController,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextField(
          controller: emailController,
          hint: 'Email',
          keyboardType: TextInputType.emailAddress,
        ),
        const SizedBox(height: 12),
        CustomTextField(
          controller: passwordController,
          hint: 'Password',
          isPassword: true,
        ),
      ],
    );
  }
}