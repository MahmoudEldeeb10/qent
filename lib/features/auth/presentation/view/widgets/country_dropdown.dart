
  import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qent/features/auth/data/models/country_model.dart';
import 'package:qent/features/auth/presentation/manager/dropdown_cubit/dropdown_cubit.dart';
import 'package:qent/features/auth/presentation/view/widgets/custom_dropdown_container.dart';

Widget countryDropdown(BuildContext context, DropdownState state) {
    if (state is DropdownLoading || state is DropdownInitial) {
      return custom_dropdown_container(
        child: const Row(
          children: [
            SizedBox(
              width: 18,
              height: 18,
              child: CircularProgressIndicator(strokeWidth: 2),
            ),
            SizedBox(width: 10),
            Text('Loading countries...', style: TextStyle(color: Colors.grey)),
          ],
        ),
      );
    }

    if (state is DropdownFailure) {
      return custom_dropdown_container(
        child: Row(
          children: [
            const Icon(Icons.error_outline, color: Colors.red, size: 18),
            const SizedBox(width: 8),
            Expanded(
              child: Text(
                'Failed to load countries',
                style: const TextStyle(color: Colors.red),
              ),
            ),
            TextButton(
              onPressed: () => context.read<DropdownCubit>().loadData(),
              child: const Text('Retry'),
            ),
          ],
        ),
      );
    }

    if (state is DropdownLoaded) {
      return custom_dropdown_container(
        child: DropdownButtonHideUnderline(
          child: DropdownButton<CountryModel>(
            isExpanded: true,
            hint: const Text('Select Country'),
            value: state.selectedCountry,
            items: state.countries.map((country) {
              final flag = country.abbreviation
                  .toUpperCase()
                  .split('')
                  .map((c) => String.fromCharCode(c.codeUnitAt(0) + 127397))
                  .join();
              return DropdownMenuItem<CountryModel>(
                value: country,
                child: Text('$flag  ${country.country}'),
              );
            }).toList(),
            onChanged: (country) {
              if (country != null) {
                context.read<DropdownCubit>().selectCountry(country);
              }
            },
          ),
        ),
      );
    }

    return const SizedBox.shrink();
  }