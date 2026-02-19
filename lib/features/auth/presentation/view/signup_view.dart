import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qent/features/auth/data/services/auth_service.dart';
import 'package:qent/features/auth/presentation/manager/auth%20cubit/auth_cubit.dart';
import 'package:qent/features/auth/presentation/view/widgets/custom_divider.dart';
import 'package:qent/features/auth/presentation/view/widgets/google_and_apple.dart';
import 'package:qent/features/auth/presentation/view/widgets/login_text.dart';
import 'package:qent/features/auth/presentation/view/widgets/sign_up_buttons.dart';
import 'package:qent/features/auth/presentation/view/widgets/signup_text_fields.dart';

class SignupView extends StatefulWidget {
  const SignupView({super.key});

  @override
  State<SignupView> createState() => _SignupViewState();
}

class _SignupViewState extends State<SignupView> {
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController country_id_Controller = TextEditingController();
  final TextEditingController location_id_Controller = TextEditingController();
  final TextEditingController national_id_Controller = TextEditingController();
  final TextEditingController date_of_birth_Controller =
      TextEditingController();

  @override
  void dispose() {
    fullNameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    passwordController.dispose();
    country_id_Controller.dispose();
    location_id_Controller.dispose();
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
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  'assets/images/black_logo.png',
                  width: 100,
                  height: 100,
                ),
                SizedBox(height: 20),
                Center(
                  child: Text(
                    'Sign Up',
                    style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(height: 40),
                SignupTextFields(
                  fullNameController: fullNameController,
                  emailController: emailController,
                  phoneController: phoneController,
                  passwordController: passwordController,
                  country_id_Controller: country_id_Controller,
                  location_id_Controller: location_id_Controller,
                  national_id_Controller: national_id_Controller,
                  date_of_birth_Controller: date_of_birth_Controller,
                ),
                SizedBox(height: 28),
                signup_buttons(
                  fullNameController: fullNameController,
                  emailController: emailController,
                  phoneController: phoneController,
                  passwordController: passwordController,
                  country_id_Controller: country_id_Controller,
                  location_id_Controller: location_id_Controller,
                ),
                SizedBox(height: 20),

                custom_divider(),
                SizedBox(height: 20),
                google_and_apple_login(),
                SizedBox(height: 28),
                login_text(),
                SizedBox(height: 28),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
