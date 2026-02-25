import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qent/features/auth/presentation/manager/create_car_cubit/create_car_cubit.dart';
import 'package:qent/features/auth/presentation/manager/create_car_cubit/create_car_state.dart';
import 'package:qent/features/auth/presentation/manager/dropdown_cubit/dropdown_cubit.dart';
import 'package:qent/features/auth/presentation/view/widgets/available_to_rent_car.dart';
import 'package:qent/features/auth/presentation/view/widgets/country_dropdown.dart';
import 'package:qent/features/auth/presentation/view/widgets/custom_text_field.dart';
import 'package:qent/features/auth/presentation/view/widgets/location_dropdown.dart';

class SignupTextFields extends StatelessWidget {
  final TextEditingController fullNameController;
  final TextEditingController emailController;
  final TextEditingController phoneController;
  final TextEditingController passwordController;
  final TextEditingController national_id_Controller;
  final TextEditingController date_of_birth_Controller;

  const SignupTextFields({
    super.key,
    required this.fullNameController,
    required this.emailController,
    required this.phoneController,
    required this.passwordController,
    required this.national_id_Controller,
    required this.date_of_birth_Controller,
  });

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [BlocProvider(create: (context) => CreateCarCubit())],
      child: Column(
        children: [
          CustomTextField(controller: fullNameController, hint: 'Full Name'),
          const SizedBox(height: 12),
          CustomTextField(controller: emailController, hint: 'Email Address'),
          const SizedBox(height: 12),
          CustomTextField(controller: phoneController, hint: 'Phone Number'),
          const SizedBox(height: 12),
          CustomTextField(
            controller: passwordController,
            hint: 'Password',
            isPassword: true,
          ),
          const SizedBox(height: 12),

          //  Country Dropdown
          BlocBuilder<DropdownCubit, DropdownState>(
            builder: (context, state) {
              return countryDropdown(context, state);
            },
          ),
          const SizedBox(height: 12),

          //  Location Dropdown
          BlocBuilder<DropdownCubit, DropdownState>(
            builder: (context, state) {
              return locationDropdown(context, state);
            },
          ),
          const SizedBox(height: 12),

          //  Available to create a car
          BlocBuilder<CreateCarCubit, CreateCarState>(
            builder: (context, state) {
              final bool isAvailable = state is AvailableToCreateCarChanged
                  ? state.value
                  : false;

              return availableToRentCar(
                isAvailable: isAvailable,
                national_id_Controller: national_id_Controller,
                date_of_birth_Controller: date_of_birth_Controller,
              );
            },
          ),
        ],
      ),
    );
  }
}
