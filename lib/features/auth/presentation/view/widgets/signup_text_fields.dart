import 'package:flutter/material.dart';
import 'package:qent/features/auth/presentation/manager/create_car_cubit/create_car_cubit.dart';
import 'package:qent/features/auth/presentation/manager/create_car_cubit/create_car_state.dart';
import 'package:qent/features/auth/presentation/view/widgets/custom_text_field.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignupTextFields extends StatelessWidget {
  final TextEditingController fullNameController;
  final TextEditingController emailController;
  final TextEditingController phoneController;
  final TextEditingController passwordController;
  final TextEditingController country_id_Controller;
  final TextEditingController location_id_Controller;

  const SignupTextFields({
    super.key,
    required this.fullNameController,
    required this.emailController,
    required this.phoneController,
    required this.passwordController,
    required this.country_id_Controller,
    required this.location_id_Controller,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CreateCarCubit(),
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
          BlocBuilder<CreateCarCubit, CreateCarState>(
            builder: (context, state) {
              final bool isAvailable = state is AvailableToCreateCarChanged
                  ? state.value
                  : false;

              return Column(
                children: [
                  Row(
                    children: [
                      const Text(
                        'Available to create a car?',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(width: 10),
                      Radio(
                        value: true,
                        groupValue: isAvailable,
                        onChanged: (value) {
                          context.read<CreateCarCubit>().changeAvailable(
                            value!,
                          );
                        },
                      ),
                      const Text("Yes"),
                      Radio(
                        value: false,
                        groupValue: isAvailable,
                        onChanged: (value) {
                          context.read<CreateCarCubit>().changeAvailable(
                            value!,
                          );
                        },
                      ),
                      const Text("No"),
                    ],
                  ),
                  const SizedBox(height: 12),
                  if (isAvailable) ...[
                    CustomTextField(
                      controller: country_id_Controller,
                      hint: 'Country ID',
                    ),
                    const SizedBox(height: 12),
                    CustomTextField(
                      controller: location_id_Controller,
                      hint: 'Location ID',
                    ),
                    const SizedBox(height: 12),
                  ],
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
