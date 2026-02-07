import 'package:flutter/material.dart';
import 'package:qent/constants.dart' as consatnts;
import 'package:qent/core/widgets/custom_button.dart';
import 'package:qent/features/auth/presentation/view/login_view.dart';
import 'package:qent/features/auth/presentation/view/signup_view.dart';
import 'package:qent/features/auth/presentation/view/verify_phone_view.dart';
import 'package:qent/features/auth/presentation/view/widgets/custom_text_field.dart';

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
                      style: TextStyle(fontSize: 14, color: consatnts.text2),
                    ),
                    Text(
                      'well send you a link to reset your password.',
                      style: TextStyle(fontSize: 14, color: consatnts.text2),
                    ),
                  ],
                ),

                SizedBox(height: 40),
                CustomTextField(controller: emailController, hint: 'Email'),
                SizedBox(height: 28),
                CustomButton(
                  text: 'Continue',
                  onpressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => VerifyPhoneView(),
                      ),
                    );
                  },
                  color: consatnts.btn_color,
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
                  style: TextStyle(color: consatnts.PrimaryColor),
                ),
              ),
            ),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('create a ', style: TextStyle(color: consatnts.text2)),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SignupView()),
                    );
                  },
                  child: Text(
                    'New Account',
                    style: TextStyle(color: consatnts.PrimaryColor),
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
