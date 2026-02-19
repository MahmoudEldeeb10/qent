import 'package:flutter/material.dart';
import 'package:qent/appnavigator.dart';

import '../login_view.dart' show LoginView;

class login_text extends StatelessWidget {
  const login_text({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('Already have an account? ', style: TextStyle(color: Colors.grey)),
        GestureDetector(
          onTap: () {
            AppNavigator.goToAndClearStack(context, LoginView());
          },
          child: Text('Login', style: TextStyle(color: Colors.black)),
        ),
      ],
    );
  }
}
