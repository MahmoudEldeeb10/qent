import 'package:flutter/material.dart';
import 'package:qent/features/search/presentation/widgets/our_popular_cars_car_card.dart';

class OurPopularCarsListView extends StatelessWidget {
  const OurPopularCarsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 2,
        itemBuilder: (BuildContext context, int index) {
          return OurPopularCarsCarCard();
        },
      ),
    );
  }
}
