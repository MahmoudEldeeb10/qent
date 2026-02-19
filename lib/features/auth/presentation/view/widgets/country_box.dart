import 'package:flutter/material.dart';
import 'package:qent/constants.dart';

class country_box extends StatelessWidget {
  const country_box({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.text2),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          // Country name
          const Text(
            'Country',
            style: TextStyle(fontSize: 16, color: Colors.grey),
          ),

          const Spacer(),

          // Arrow
          Icon(Icons.keyboard_arrow_down, color: Colors.grey.shade600),
        ],
      ),
    );
  }
}
