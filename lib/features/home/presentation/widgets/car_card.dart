import 'package:flutter/material.dart';
import 'package:qent/constants.dart';

class CarCard extends StatelessWidget {
  const CarCard({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Container(
      width: screenWidth * 0.45,
      height: screenHeight * 0.28,
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.cars_background, width: 1.5),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          // صندوق الصورة
          Expanded(
            flex: 3,
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: AppColors.cars_background,
                borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
              ),
              child: Padding(
                padding: EdgeInsets.all(screenWidth * 0.03),
                child: Image.asset(
                  'assets/images/car_img.png',
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),

          // صندوق المعلومات
          Expanded(
            flex: 2,
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(20),
                ),
              ),
              child: Padding(
                padding: EdgeInsets.all(screenWidth * 0.02),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      'Ferrari-FF',
                      style: TextStyle(
                        fontSize: screenWidth * 0.035,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          '5.0',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: screenWidth * 0.03,
                          ),
                        ),
                        Icon(
                          Icons.star_rounded,
                          color: Colors.amber,
                          size: screenWidth * 0.035,
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.location_on_rounded,
                          size: screenWidth * 0.035,
                        ),
                        Text(
                          'Egypt',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: screenWidth * 0.03,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(Icons.chair, size: screenWidth * 0.035),
                        Text(
                          '4 Seats',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: screenWidth * 0.028,
                          ),
                        ),
                        Spacer(),
                        Icon(Icons.money_rounded, size: screenWidth * 0.035),
                        Text(
                          '\$200/Day',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: screenWidth * 0.028,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
