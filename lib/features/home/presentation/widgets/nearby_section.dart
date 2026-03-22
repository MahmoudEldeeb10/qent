import 'package:flutter/material.dart';
import 'package:qent/constants.dart';

class NearBySection extends StatelessWidget {
  const NearBySection({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Row(
          children: [
            const Text(
              'Nearby',
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Spacer(),
            GestureDetector(
              onTap: () {},
              child: Text('View All', style: TextStyle(color: AppColors.text2)),
            ),
          ],
        ),
        SizedBox(height: 16),
        Container(
          height: screenHeight * 0.18,
          width: double.infinity,
          decoration: BoxDecoration(
            color: AppColors.cars_background,
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Image.asset(
              'assets/images/car_img.png',
              fit: BoxFit.contain,
            ),
          ),
        ),
      ],
    );
  }
}
