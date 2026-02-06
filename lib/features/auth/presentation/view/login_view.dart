import 'package:flutter/material.dart';
import 'package:qent/constants.dart' as constants;
import 'package:qent/core/widgets/custom_button.dart';
import 'package:qent/features/auth/presentation/view/signup_view.dart';
import 'package:qent/features/auth/presentation/view/widgets/custom_divider.dart';
import 'package:qent/features/auth/presentation/view/widgets/custom_text_field.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  late TextEditingController emailController;
  late TextEditingController passwordController;

  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
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
              //logo
              Image.asset(
                'assets/images/black_logo.png',
                width: 100,
                height: 100,
              ),
              SizedBox(height: 10),
              //text
              Text(
                'Welcome Back\nReady to hit the road.',
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 40),
              // Email
              CustomTextField(
                controller: emailController,
                hint: 'Email',
                keyboardType: TextInputType.emailAddress,
              ),
              SizedBox(height: 12),
              //password
              CustomTextField(
                controller: passwordController,
                hint: 'Password',
                isPassword: true,
              ),
              SizedBox(height: 10),
              //remember me and forgot password
              Row(
                children: [
                  Row(
                    children: [
                      Checkbox(value: false, onChanged: (value) {}),
                      Text('Remember Me'),
                    ],
                  ),
                  Spacer(),
                  Text('Forgot Password'),
                ],
              ),
              SizedBox(height: 20),

              CustomButton(
                text: 'Login',
                onpressed: () {},
                color: Color(0xff21292B),
                textColor: Colors.white,
              ),
              SizedBox(height: 18),
              CustomButton(
                sideColor: Colors.black,

                text: 'Sign Up',
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
                text: 'Apple', //
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
                    'Don\'t have an account? ',
                    style: TextStyle(color: Colors.grey),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SignupView()),
                      );
                    },
                    child: Text(
                      'Sign Up',
                      style: TextStyle(color: Colors.black),
                    ),
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
