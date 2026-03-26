import 'package:flutter/material.dart';
import 'package:qent/constants.dart';
import 'package:qent/features/search/presentation/widgets/our_popular_cars_listview.dart';

class OurPopularCars extends StatelessWidget {
  const OurPopularCars({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              'Our Popular Cars',
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
        OurPopularCarsListView(),
      ],
    );
  }
}

class OurPopularCarsCarCard extends StatelessWidget {
  const OurPopularCarsCarCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 16.0),
      child: Container(
        width: 250,
        height: 80,
        decoration: BoxDecoration(
          color: AppColors.stoke,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Expanded(child: Image.asset('assets/images/car_img.png')),
              SizedBox(width: 8),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Ferrari Laferrari',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Row(
                      children: [
                        Text('4.5', style: TextStyle(fontSize: 12)),
                        Icon(Icons.star, color: Colors.amber, size: 16),
                      ],
                    ),
                    Text('\$100', style: TextStyle(fontSize: 12)),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
