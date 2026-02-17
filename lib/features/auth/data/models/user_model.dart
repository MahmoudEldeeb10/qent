import 'package:qent/features/auth/data/models/country_model.dart';
import 'package:qent/features/auth/data/models/location_model.dart';

class UserModel {
  final int id;
  final String fullName;
  final String email;
  final String phone;
  final bool phoneIsVerified;
  final CountryModel country;
  final LocationModel location;
  final double balance;

  UserModel({
    required this.id,
    required this.fullName,
    required this.email,
    required this.phone,
    required this.phoneIsVerified,
    required this.country,
    required this.location,
    required this.balance,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    id: json['id'],
    fullName: json['full_name'],
    email: json['email'],
    phone: json['phone'],
    phoneIsVerified: json['phone_is_verified'],
    country: CountryModel.fromJson(json['country']),
    location: LocationModel.fromJson(json['location']),
    balance: (json['balance'] as num).toDouble(),
  );
}
