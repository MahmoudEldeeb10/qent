import 'package:flutter/material.dart';
import 'package:qent/constants.dart' as consatnts;
import 'package:qent/core/widgets/custom_button.dart';
import 'package:qent/features/auth/presentation/view/widgets/otp_fields.dart';

class OtpView extends StatelessWidget {
  const OtpView({super.key});

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
            Spacer(flex: 1),

            Column(
              children: [
                Text(
                  'Enter Verification Code',
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 16),
                Text(
                  'We have sent the code to : +20 *******2523',
                  style: TextStyle(fontSize: 14, color: consatnts.text2),
                ),
                SizedBox(height: 16),

                //
                otp_fields(),

                //
                SizedBox(height: 16),
                CustomButton(
                  text: 'Continue',
                  onpressed: () {},
                  color: consatnts.btn_color,
                  textColor: Colors.white,
                ),

                SizedBox(height: 16),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Don\'t recieve the OTP?  ',
                      style: TextStyle(color: Colors.grey),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Text(
                        'Resend',
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Spacer(flex: 2),
          ],
        ),
      ),
    );
  }
}
