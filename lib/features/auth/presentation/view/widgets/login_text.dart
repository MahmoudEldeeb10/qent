import 'package:flutter/material.dart';

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
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => LoginView()),
            );
          },
          child: Text('Login', style: TextStyle(color: Colors.black)),
        ),
      ],
    );
  }
}
