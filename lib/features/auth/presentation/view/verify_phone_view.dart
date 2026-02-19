import 'package:flutter/material.dart';
import 'package:qent/constants.dart';
import 'package:qent/core/widgets/custom_button.dart';
import 'package:qent/features/auth/presentation/view/otp_view.dart';
import 'package:qent/features/auth/presentation/view/widgets/country_box.dart';
import 'package:qent/features/auth/presentation/view/widgets/custom_text_field.dart';

class VerifyPhoneView extends StatefulWidget {
  const VerifyPhoneView({super.key});

  @override
  State<VerifyPhoneView> createState() => _VerifyPhoneViewState();
}

class _VerifyPhoneViewState extends State<VerifyPhoneView> {
  late TextEditingController phoneController;
  @override
  void initState() {
    super.initState();
    phoneController = TextEditingController();
  }

  @override
  void dispose() {
    phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
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
            Spacer(),
            Column(
              children: [
                Text(
                  'Verify your phone number',
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 16),
                Text(
                  'We have sent you an SMS with a code to number',
                  style: TextStyle(fontSize: 14, color: AppColors.text2),
                ),
                SizedBox(height: 28),

                country_box(),
                SizedBox(height: 18),
                CustomTextField(
                  controller: phoneController,
                  hint: 'Phone Number',
                  keyboardType: TextInputType.phone,
                ),

                SizedBox(height: 28),
                CustomButton(
                  text: 'Continue',
                  onpressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => OtpView()),
                    );
                  },
                  color: AppColors.btn_color,
                  textColor: Colors.white,
                ),
              ],
            ),

            Spacer(),
          ],
        ),
      ),
    );
  }
}
