
import 'package:flutter/material.dart';

class BrandItem extends StatelessWidget {
  const BrandItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 30),
      child: Column(
        children: [
          Container(
            height: 60,
            width: 60,
            decoration: const BoxDecoration(
              color: Colors.black,
              shape: BoxShape.circle,
            ),
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Image.asset('assets/images/car_icon.png'),
            ),
          ),

          const SizedBox(height: 8),

          Text('Brand Name', style: const TextStyle(fontSize: 12)),
        ],
      ),
    );
  }
}
