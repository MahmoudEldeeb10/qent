import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qent/features/auth/presentation/manager/create_car_cubit/create_car_cubit.dart';
import 'package:qent/features/auth/presentation/view/widgets/custom_text_field.dart';

class availableToRentCar extends StatelessWidget {
  const availableToRentCar({
    super.key,
    required this.isAvailable,
    required this.national_id_Controller,
    required this.date_of_birth_Controller,
  });

  final bool isAvailable;
  final TextEditingController national_id_Controller;
  final TextEditingController date_of_birth_Controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      // mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Available to create a car?',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 12),

        Row(
          children: [
            Expanded(
              child: GestureDetector(
                onTap: () {
                  context.read<CreateCarCubit>().changeAvailable(true);
                },
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  decoration: BoxDecoration(
                    color: isAvailable == true ? Colors.black : Colors.white,
                    border: Border.all(color: Colors.black45),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Center(
                    child: Text(
                      "Yes",
                      style: TextStyle(
                        color: isAvailable == true
                            ? Colors.white
                            : Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: GestureDetector(
                onTap: () {
                  context.read<CreateCarCubit>().changeAvailable(false);
                },
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  decoration: BoxDecoration(
                    color: isAvailable == false ? Colors.black : Colors.white,
                    border: Border.all(color: Colors.black45),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Center(
                    child: Text(
                      "No",
                      style: TextStyle(
                        color: isAvailable == false
                            ? Colors.white
                            : Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),

        //
        if (isAvailable) ...[
          const SizedBox(height: 12),
          CustomTextField(
            controller: national_id_Controller,
            hint: 'National ID',
          ),
          const SizedBox(height: 12),
          CustomTextField(
            controller: date_of_birth_Controller,
            hint: 'Date of Birth',
          ),
          const SizedBox(height: 12),
        ],
      ],
    );
  }
}
