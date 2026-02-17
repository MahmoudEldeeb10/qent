import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qent/features/auth/data/services/auth_service.dart';
import 'package:qent/features/auth/presentation/manager/auth%20cubit/auth_cubit.dart';
import 'package:qent/features/auth/presentation/view/widgets/custom_divider.dart';
import 'package:qent/features/auth/presentation/view/widgets/google_and_apple.dart';
import 'package:qent/features/auth/presentation/view/widgets/login_bottuns.dart';
import 'package:qent/features/auth/presentation/view/widgets/login_text_fields.dart';
import 'package:qent/features/auth/presentation/view/widgets/remember_me.dart';
import 'package:qent/features/auth/presentation/view/widgets/sign_up_text.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(AuthService()),
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  'assets/images/black_logo.png',
                  width: 100,
                  height: 100,
                ),
                const SizedBox(height: 10),
                const Text(
                  'Welcome Back\nReady to hit the road.',
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 40),
                LoginTextFields(
                  emailController: emailController,
                  passwordController: passwordController,
                ),
                const SizedBox(height: 10),
                remember_me(),
                const SizedBox(height: 20),
                login_buttons(
                  emailController: emailController,
                  passwordController: passwordController,
                ),
                const SizedBox(height: 20),
                custom_divider(),
                const SizedBox(height: 20),
                google_and_apple_login(),
                const SizedBox(height: 28),
                singup_text(),
                const SizedBox(height: 28),
              ],
            ),
          ),
        ),
      ),
    );
  }
}