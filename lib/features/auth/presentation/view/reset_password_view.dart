import 'package:flutter/material.dart';
import 'package:qent/appnavigator.dart';
import 'package:qent/constants.dart';
import 'package:qent/core/widgets/custom_button.dart';
import 'package:qent/features/auth/presentation/view/login_view.dart';
import 'package:qent/features/auth/presentation/view/signup_view.dart';
import 'package:qent/features/auth/presentation/view/widgets/custom_text_field.dart';
import 'package:qent/features/auth/presentation/view/widgets/email_otp_view.dart';

class ResetPasswordView extends StatefulWidget {
  const ResetPasswordView({super.key});

  @override
  State<ResetPasswordView> createState() => _ResetPasswordViewState();
}

class _ResetPasswordViewState extends State<ResetPasswordView> {
  late TextEditingController emailController;

  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
  }

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(16),
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
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Reset Password',
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                Column(
                  children: [
                    Text(
                      'Enter the email address associated with your account and',
                      style: TextStyle(fontSize: 14, color: AppColors.text2),
                    ),
                    Text(
                      'well send you a link to reset your password.',
                      style: TextStyle(fontSize: 14, color: AppColors.text2),
                    ),
                  ],
                ),

                SizedBox(height: 40),
                CustomTextField(controller: emailController, hint: 'Email'),
                SizedBox(height: 28),
                CustomButton(
                  text: 'Continue',
                  onpressed: () {
                    AppNavigator.goToAndClearStack(
                      context,
                      EmailOtpView(
                        email: emailController.text,
                      ),
                    );
                  },
                  color: AppColors.btn_color,
                  textColor: Colors.white,
                ),
              ],
            ),
            SizedBox(height: 28),
            Center(
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginView()),
                  );
                },
                child: Text(
                  'return to sign in',
                  style: TextStyle(color: AppColors.primaryColor),
                ),
              ),
            ),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('create a ', style: TextStyle(color: AppColors.text2)),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SignupView()),
                    );
                  },
                  child: Text(
                    'New Account',
                    style: TextStyle(color: AppColors.primaryColor),
                  ),
                ),
              ],
            ),

            SizedBox(height: 28),
          ],
        ),
      ),
    );
  }
}
