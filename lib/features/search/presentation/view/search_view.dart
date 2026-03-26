import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qent/core/widgets/custom_app_bar.dart';
import 'package:qent/core/widgets/search_section.dart';
import 'package:qent/features/home/presentation/widgets/car_card_gridview.dart';
import 'package:qent/features/search/presentation/manager/cubit/category_cubit.dart';
import 'package:qent/features/search/presentation/widgets/categories_row_list_view.dart';
import 'package:qent/features/search/presentation/widgets/our_popular_cars.dart';

class SearchView extends StatefulWidget {
  const SearchView({super.key});

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CategoryCubit(),
      child: Scaffold(
        appBar: const CustomAppBar(),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // const SizedBox(height: 16),
              const SearchSection(),
              const CategoriesRowListView(),
              CarCardGridView(
                carsNumber: 4,
                title: 'Recommended For You',
                subTitle: 'View All',
              ),

              OurPopularCars(),
            ],
          ),
        ),
      ),
    );
  }
}
