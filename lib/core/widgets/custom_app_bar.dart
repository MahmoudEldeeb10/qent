import 'package:flutter/material.dart';
import 'package:qent/constants.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      centerTitle: true,
      title: Text(
        "Search",
        style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
      ),
      leading: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: AppColors.stoke),
          ),
          child: IconButton(
            icon: Icon(Icons.arrow_back_ios_new, color: Colors.black, size: 18),
            onPressed: () {},
          ),
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: AppColors.stoke),
            ),
            child: IconButton(
              icon: Icon(Icons.more_horiz, color: Colors.black),
              onPressed: () {},
            ),
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
