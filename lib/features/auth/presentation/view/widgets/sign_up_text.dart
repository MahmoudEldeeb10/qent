import 'package:flutter/material.dart';
import 'package:qent/appnavigator.dart';
import 'package:qent/features/auth/presentation/view/signup_view.dart';

class singup_text extends StatelessWidget {
  const singup_text({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          'Don\'t have an account? ',
          style: TextStyle(color: Colors.grey),
        ),
        GestureDetector(
          onTap: () {
            AppNavigator.goToAndClearStack(context, SignupView());
          },
          child: const Text('Sign Up', style: TextStyle(color: Colors.black)),
        ),
      ],
    );
  }
}
