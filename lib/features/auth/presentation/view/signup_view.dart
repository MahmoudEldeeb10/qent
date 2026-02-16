import 'package:flutter/material.dart';
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              SignupTextFields(),
              SizedBox(height: 28),
              signup_buttons(),
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
    );
  }
}
