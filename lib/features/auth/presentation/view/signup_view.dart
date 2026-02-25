import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qent/features/auth/data/services/auth_service.dart';
import 'package:qent/features/auth/data/services/public_service.dart';
import 'package:qent/features/auth/presentation/manager/auth%20cubit/auth_cubit.dart';
import 'package:qent/features/auth/presentation/manager/dropdown_cubit/dropdown_cubit.dart';
import 'package:qent/features/auth/presentation/view/widgets/custom_divider.dart';
import 'package:qent/features/auth/presentation/view/widgets/google_and_apple.dart';
import 'package:qent/features/auth/presentation/view/widgets/login_text.dart';
import 'package:qent/features/auth/presentation/view/widgets/sign_up_buttons.dart';
import 'package:qent/features/auth/presentation/view/widgets/signup_text_fields.dart';

class SignupView extends StatelessWidget {
  SignupView({super.key});

  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController national_id_Controller = TextEditingController();
  final TextEditingController date_of_birth_Controller =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => AuthCubit(AuthService())),
        BlocProvider(create: (_) => DropdownCubit(PublicService())..loadData()),
      ],
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  'assets/images/black_logo.png',
                  width: 100,
                  height: 100,
                ),
                const SizedBox(height: 20),
                const Center(
                  child: Text(
                    'Sign Up',
                    style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(height: 40),
                SignupTextFields(
                  fullNameController: fullNameController,
                  emailController: emailController,
                  phoneController: phoneController,
                  passwordController: passwordController,
                  national_id_Controller: national_id_Controller,
                  date_of_birth_Controller: date_of_birth_Controller,
                ),
                const SizedBox(height: 28),
                signup_buttons(
                  fullNameController: fullNameController,
                  emailController: emailController,
                  phoneController: phoneController,
                  passwordController: passwordController,
                ),
                const SizedBox(height: 20),
                custom_divider(),
                const SizedBox(height: 20),
                google_and_apple_login(),
                const SizedBox(height: 28),
                login_text(),
                const SizedBox(height: 28),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
