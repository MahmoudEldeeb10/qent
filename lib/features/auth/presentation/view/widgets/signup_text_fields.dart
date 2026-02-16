import 'package:flutter/material.dart';
import 'package:qent/features/auth/presentation/view/widgets/custom_text_field.dart';

class SignupTextFields extends StatefulWidget {
  const SignupTextFields({super.key});

  @override
  State<SignupTextFields> createState() => _SignupTextFieldsState();
}

class _SignupTextFieldsState extends State<SignupTextFields> {
  bool availableToCreateCar = false;

  late TextEditingController fullNameController;
  late TextEditingController emailController;
  late TextEditingController phoneController;
  late TextEditingController passwordController;
  late TextEditingController country_id_Controller;
  late TextEditingController location_id_Controller;
  @override
  void initState() {
    super.initState();
    fullNameController = TextEditingController();
    emailController = TextEditingController();
    phoneController = TextEditingController();
    passwordController = TextEditingController();
    country_id_Controller = TextEditingController();
    location_id_Controller = TextEditingController();
  }

  @override
  void dispose() {
    fullNameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    passwordController.dispose();
    country_id_Controller.dispose();
    location_id_Controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Column(
                children: [
                  CustomTextField(
                    controller: fullNameController,
                    hint: 'Full Name',
                  ),
                  SizedBox(height: 12),
                  CustomTextField(
                    controller: emailController,
                    hint: 'Email Adress',
                  ),
                  SizedBox(height: 12),

                  CustomTextField(
                    controller: phoneController,
                    hint: 'Phone Number',
                  ),
                  SizedBox(height: 12),
                  CustomTextField(
                    controller: passwordController,
                    hint: 'Password',
                    isPassword: true,
                  ),
                  SizedBox(height: 12),

                  Row(
                    children: [
                      Text(
                        'Available to create a car?',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      SizedBox(width: 10),
                      Radio(
                        value: true,
                        groupValue: availableToCreateCar,
                        onChanged: (value) {
                          setState(() {
                            availableToCreateCar = value!;
                          });
                        },
                      ),
                      Text("Yes"),
                      Radio(
                        value: false,
                        groupValue: availableToCreateCar,
                        onChanged: (value) {
                          setState(() {
                            availableToCreateCar = value!;
                          });
                        },
                      ),
                      Text("No"),
                    ],
                  ),
                  SizedBox(height: 12),

                  if (availableToCreateCar) ...[
                    CustomTextField(
                      controller: country_id_Controller,
                      hint: 'Country ID ',
                    ),
                    SizedBox(height: 12),

                    CustomTextField(
                      controller: location_id_Controller,
                      hint: 'Location ID',
                    ),
                    SizedBox(height: 12),
                  ],

                ],
              );

  }
}