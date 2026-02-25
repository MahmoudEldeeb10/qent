
  import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qent/features/auth/data/models/location_model.dart';
import 'package:qent/features/auth/presentation/manager/dropdown_cubit/dropdown_cubit.dart';
import 'package:qent/features/auth/presentation/view/widgets/custom_dropdown_container.dart';
  Widget locationDropdown(BuildContext context, DropdownState state) {
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
            Text('Loading locations...', style: TextStyle(color: Colors.grey)),
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
            const Expanded(
              child: Text(
                'Failed to load locations',
                style: TextStyle(color: Colors.red),
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
          child: DropdownButton<LocationModel>(
            isExpanded: true,
            hint: const Text('Select Location'),
            value: state.selectedLocation,
            items: state.locations.map((location) {
              return DropdownMenuItem<LocationModel>(
                value: location,
                child: Text(location.name),
              );
            }).toList(),
            onChanged: (location) {
              if (location != null) {
                context.read<DropdownCubit>().selectLocation(location);
              }
            },
          ),
        ),
      );
    }

    return const SizedBox.shrink();
  }