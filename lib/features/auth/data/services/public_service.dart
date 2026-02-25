import 'package:dio/dio.dart';
import 'package:qent/features/auth/data/models/country_model.dart';
import 'package:qent/features/auth/data/models/location_model.dart';

class PublicService {
  final Dio _dio;

  static const String _baseUrl = 'https://qent.azurewebsites.net/api';

  PublicService()
    : _dio = Dio(
        BaseOptions(
          baseUrl: _baseUrl,
          connectTimeout: const Duration(seconds: 15),
          receiveTimeout: const Duration(seconds: 15),
          headers: {'Content-Type': 'application/json'},
        ),
      );

  /// Fetches ALL countries by looping through all pages
  Future<List<CountryModel>> fetchAllCountries() async {
    final List<CountryModel> allCountries = [];
    int currentPage = 1;
    int? lastPage;

    do {
      final response = await _dio.get(
        '/public/countries/',
        queryParameters: {'page': currentPage},
      );

      final data = response.data;
      final List items = data['data'];
      allCountries.addAll(items.map((e) => CountryModel.fromJson(e)));

      lastPage ??= data['meta']['last_page'];
      currentPage++;
    } while (currentPage <= lastPage!);

    return allCountries;
  }

  /// Fetches ALL locations by looping through all pages
  Future<List<LocationModel>> fetchLocations() async {
    final List<LocationModel> allLocations = [];
    int currentPage = 1;
    int? lastPage;

    do {
      final response = await _dio.get(
        '/public/register_locations/',
        queryParameters: {'page': currentPage},
      );

      final data = response.data;
      final List items = data['data'];
      allLocations.addAll(items.map((e) => LocationModel.fromJson(e)));

      lastPage ??= data['meta']['last_page'];
      currentPage++;
    } while (currentPage <= lastPage!);

    return allLocations;
  }
}
