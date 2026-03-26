
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qent/features/search/presentation/manager/cubit/category_cubit.dart';
import 'package:qent/features/search/presentation/widgets/categoris_row.dart';

class CategoriesRowListView extends StatelessWidget {
  const CategoriesRowListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70,
      child: BlocBuilder<CategoryCubit, int>(
        builder: (context, selectedIndex) {
          return ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 5,
            itemBuilder: (context, index) {
              return CategoriesRow(
                isSelected: index == selectedIndex,
                onTap: () {
                  context.read<CategoryCubit>().selectCategory(index);
                },
              );
            },
          );
        },
      ),
    );
  }
}
