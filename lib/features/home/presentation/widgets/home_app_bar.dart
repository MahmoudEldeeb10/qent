import 'package:flutter/material.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset('assets/images/black_logo.png', height: 90, width: 90),
        Spacer(),
        IconButton(onPressed: () {}, icon: Icon(Icons.notifications)),
        CircleAvatar(
          radius: 12,
          backgroundImage: AssetImage('assets/images/profile.png'),
        ),
      ],
    );
  }
}
