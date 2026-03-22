import 'package:flutter/material.dart';
import 'package:qent/constants.dart';
import 'package:qent/features/home/presentation/widgets/car_card.dart';

class CarCardGridView extends StatelessWidget {
  const CarCardGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const Text(
              'Best Cars',
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

        GridView(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 16,
            crossAxisSpacing: 16,
            childAspectRatio: 0.8,
          ),
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          children: List.generate(2, (index) => const CarCard()),
        ),
      ],
    );
  }
}
