import 'package:flutter/material.dart';
import 'package:qent/features/auth/presentation/view/reset_password_view.dart';

class remember_me extends StatelessWidget {
  const remember_me({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Row(
          children: const [
            Checkbox(value: false, onChanged: null),
            Text('Remember Me'),
          ],
        ),
        const Spacer(),
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ResetPasswordView(),
              ),
            );
          },
          child: const Text('Forgot Password'),
        ),
      ],
    );
  }
}
