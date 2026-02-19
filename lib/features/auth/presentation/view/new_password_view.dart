import 'package:flutter/material.dart';
import 'package:qent/constants.dart';
import 'package:qent/core/widgets/custom_button.dart';
import 'package:qent/features/auth/presentation/view/widgets/custom_text_field.dart';

class NewPasswordView extends StatefulWidget {
  const NewPasswordView({super.key});

  @override
  State<NewPasswordView> createState() => _NewPasswordViewState();
}

final TextEditingController newpasswordController = TextEditingController();
final TextEditingController confirmNewPasswordController =
    TextEditingController();

class _NewPasswordViewState extends State<NewPasswordView> {
  @override
  Widget build(BuildContext context) {
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
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 28),
            CustomTextField(
              controller: newpasswordController,
              hint: 'New Password',
            ),
            SizedBox(height: 16),
            CustomTextField(
              controller: confirmNewPasswordController,
              hint: 'Confirm New Password',
            ),
            SizedBox(height: 16),
            CustomButton(
              text: 'Continue',

              color: AppColors.btn_color,
              textColor: Colors.white,
              onpressed: () {},
            ),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Create a  ', style: TextStyle(color: Colors.grey)),
                GestureDetector(
                  onTap: () {},
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
  }
}
