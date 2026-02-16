import 'package:flutter/material.dart';
import 'package:qent/constants.dart' as constants;
import 'package:qent/core/widgets/custom_button.dart';

class google_and_apple_login extends StatelessWidget {
  const google_and_apple_login({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomButton(
          text: 'Apple',
          onpressed: () {},
          color: constants.SecondaryColor,
          textColor: Colors.black,
          icon: const Icon(Icons.apple, color: Colors.black),
        ),
        const SizedBox(height: 18),
        // Google Button
        CustomButton(
          text: 'Google',
          onpressed: () {},
          color: constants.SecondaryColor,
          textColor: Colors.black,
          icon: const Icon(Icons.g_mobiledata, color: Colors.black),
        ),
      ],
    );
  }
}
