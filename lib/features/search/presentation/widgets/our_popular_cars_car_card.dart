import 'package:flutter/material.dart';
import 'package:qent/constants.dart';

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
