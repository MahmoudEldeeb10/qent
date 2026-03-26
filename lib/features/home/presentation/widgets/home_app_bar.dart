import 'package:flutter/material.dart';
import 'package:qent/constants.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  Widget build(BuildContext context) {
    return AppBar(
      leadingWidth: 100,
      toolbarHeight: 80,
      leading: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Image.asset('assets/images/black_logo.png', fit: BoxFit.contain),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.fromLTRB(8, 8, 0, 8),
          child: IconButton(onPressed: () {}, icon: Icon(Icons.notifications)),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 8, 8, 8),
          child: CircleAvatar(
            radius: 12,
            backgroundImage: AssetImage('assets/images/profile.png'),
          ),
        ),
      ],
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(1.0),
        child: Container(color: AppColors.stoke, height: 1.0),
      ),
    );
  }
}
