import 'package:flutter/material.dart';
import 'package:qent/constants.dart';
import 'package:qent/features/home/presentation/widgets/car_card.dart';

class CarCardGridView extends StatelessWidget {
  final int carsNumber;
  final String title;
  final String subTitle;
  const CarCardGridView({
    super.key,
    required this.carsNumber,
    required this.title,
    required this.subTitle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              title,
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Spacer(),
            GestureDetector(
              onTap: () {},
              child: Text(subTitle, style: TextStyle(color: AppColors.text2)),
            ),
          ],
        ),
        SizedBox(height: 8),
        GridView(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 16,
            crossAxisSpacing: 16,
            childAspectRatio: 0.8,
          ),
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          children: List.generate(carsNumber, (index) => const CarCard()),
        ),
      ],
    );
  }
}
