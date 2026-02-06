import 'package:flutter/material.dart';
import 'package:qent/constants.dart' as constants;
import 'package:qent/core/widgets/custom_button.dart';
import 'package:qent/features/auth/presentation/view/login_view.dart';
import 'package:qent/features/auth/presentation/view/widgets/custom_divider.dart';
import 'package:qent/features/auth/presentation/view/widgets/custom_text_field.dart';

class SignupView extends StatefulWidget {
  const SignupView({super.key});

  @override
  State<SignupView> createState() => _SignupViewState();
}

class _SignupViewState extends State<SignupView> {
  late TextEditingController fullNameController;
  late TextEditingController emailController;
  late TextEditingController passwordController;
  late TextEditingController countryController;

  @override
  void initState() {
    super.initState();
    fullNameController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    countryController = TextEditingController();
  }

  @override
  void dispose() {
    fullNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    countryController.dispose();
    super.dispose();
  }

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
              //text fields
              CustomTextField(
                controller: fullNameController,
                hint: 'Full Name',
              ),
              SizedBox(height: 12),
              CustomTextField(
                controller: emailController,
                hint: 'Email Adress',
              ),
              SizedBox(height: 12),
              CustomTextField(
                controller: passwordController,
                hint: 'Password',
                isPassword: true,
              ),
              SizedBox(height: 12),
              CustomTextField(controller: countryController, hint: 'Country'),
              SizedBox(height: 28),

              //
              CustomButton(
                text: 'Sign Up',
                onpressed: () {},
                color: Color(0xff21292B),
                textColor: Colors.white,
              ),
              SizedBox(height: 18),
              CustomButton(
                sideColor: Colors.black,
                text: 'Login',
                onpressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SignupView()),
                  );
                },
                color: constants.SecondaryColor,
                textColor: Colors.black,
              ),
              SizedBox(height: 20),

              custom_divider(),
              SizedBox(height: 20),
              CustomButton(
                text: 'Apple',
                onpressed: () {},
                color: constants.SecondaryColor,
                textColor: Colors.black,
                icon: Icon(Icons.apple, color: Colors.black),
              ),
              SizedBox(height: 18),
              CustomButton(
                text: 'Google',
                onpressed: () {},
                color: constants.SecondaryColor,
                textColor: Colors.black,
                icon: Icon(Icons.g_mobiledata, color: Colors.black),
              ),
              SizedBox(height: 28),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Already have an account? ',
                    style: TextStyle(color: Colors.grey),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LoginView()),
                      );
                    },
                    child: Text('Login', style: TextStyle(color: Colors.black)),
                  ),
                ],
              ),
              SizedBox(height: 28),
            ],
          ),
        ),
      ),
    );
  }
}
