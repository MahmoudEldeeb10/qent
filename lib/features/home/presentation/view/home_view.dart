import 'package:flutter/material.dart';
import 'package:qent/features/home/presentation/widgets/brand_section.dart';
import 'package:qent/features/home/presentation/widgets/car_card_gridview.dart';
import 'package:qent/features/home/presentation/widgets/home_app_bar.dart';
import 'package:qent/features/home/presentation/widgets/nearby_section.dart';
import 'package:qent/features/home/presentation/widgets/search_section.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HomeAppBar(),
              Divider(color: Colors.grey, thickness: 1),
              SizedBox(height: 16),
              SearchSection(),
              SizedBox(height: 16),
              BrandsSection(),
              SizedBox(height: 16),
              CarCardGridView(),
              SizedBox(height: 16),
              NearBySection(),
            ],
          ),
        ),
      ),
    );
  }
}
