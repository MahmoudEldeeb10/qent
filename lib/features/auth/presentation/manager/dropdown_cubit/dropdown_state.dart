part of 'dropdown_cubit.dart';

abstract class DropdownState {
  const DropdownState();
}

class DropdownInitial extends DropdownState {}

class DropdownLoading extends DropdownState {}

class DropdownLoaded extends DropdownState {
  final List<CountryModel> countries;
  final List<LocationModel> locations;
  final CountryModel? selectedCountry;
  final LocationModel? selectedLocation;

  const DropdownLoaded({
    required this.countries,
    required this.locations,
    this.selectedCountry,
    this.selectedLocation,
  });

  DropdownLoaded copyWith({
    List<CountryModel>? countries,
    List<LocationModel>? locations,
    CountryModel? selectedCountry,
    LocationModel? selectedLocation,
  }) {
    return DropdownLoaded(
      countries: countries ?? this.countries,
      locations: locations ?? this.locations,
      selectedCountry: selectedCountry ?? this.selectedCountry,
      selectedLocation: selectedLocation ?? this.selectedLocation,
    );
  }
}

class DropdownFailure extends DropdownState {
  final String message;
  const DropdownFailure(this.message);
}