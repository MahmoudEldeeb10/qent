import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qent/features/auth/data/models/country_model.dart';
import 'package:qent/features/auth/data/models/location_model.dart';
import 'package:qent/features/auth/data/services/public_service.dart';

part 'dropdown_state.dart';

class DropdownCubit extends Cubit<DropdownState> {
  final PublicService _publicService;

  DropdownCubit(this._publicService) : super(DropdownInitial());

  Future<void> loadData() async {
    emit(DropdownLoading());
    try {
      final results = await Future.wait([
        _publicService.fetchAllCountries(),
        _publicService.fetchLocations(),
      ]);

      emit(DropdownLoaded(
        countries: results[0] as List<CountryModel>,
        locations: results[1] as List<LocationModel>,
      ));
    } catch (e) {
      emit(DropdownFailure(e.toString()));
    }
  }

  void selectCountry(CountryModel country) {
    if (state is DropdownLoaded) {
      emit((state as DropdownLoaded).copyWith(selectedCountry: country));
    }
  }

  void selectLocation(LocationModel location) {
    if (state is DropdownLoaded) {
      emit((state as DropdownLoaded).copyWith(selectedLocation: location));
    }
  }
}