
import 'package:flutter/material.dart';
import 'package:qent/constants.dart' as constants;
import 'package:qent/core/widgets/custom_button.dart';
import 'package:qent/features/auth/presentation/view/signup_view.dart';

class login_buttons extends StatelessWidget {
  const login_buttons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomButton(
          text: 'Login',
          onpressed: () {},
          color: const Color(0xff21292B),
          textColor: Colors.white,
        ),
        const SizedBox(height: 18),
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
      ],
    );
  }
}
