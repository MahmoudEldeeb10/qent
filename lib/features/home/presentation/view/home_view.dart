import 'package:flutter/material.dart';
import 'package:qent/features/home/presentation/widgets/brand_section.dart';
import 'package:qent/features/home/presentation/widgets/car_card_gridview.dart';
import 'package:qent/features/home/presentation/widgets/home_app_bar.dart';
import 'package:qent/features/home/presentation/widgets/nearby_section.dart';
import 'package:qent/core/widgets/search_section.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const HomeAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 16),
              SearchSection(),
              const SizedBox(height: 16),
              BrandsSection(),
              const SizedBox(height: 16),
              CarCardGridView(),
              const SizedBox(height: 16),
              NearBySection(),
            ],
          ),
        ),
      ),
    );
  }
}
