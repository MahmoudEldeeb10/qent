import 'package:flutter/material.dart';
import 'package:qent/core/widgets/custom_button.dart';

class FirstView extends StatelessWidget {
  final VoidCallback onNext;

  const FirstView({super.key, required this.onNext});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: Image.asset(
            'assets/images/background_img_1.png',
            fit: BoxFit.cover,
          ),
        ),

        Positioned.fill(
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.black.withOpacity(0.8),
                  Colors.black.withOpacity(0.8),
                  Colors.transparent,
                ],
              ),
            ),
          ),
        ),

        Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 40),
              Image.asset('assets/images/car_icon.png', width: 60),
              const SizedBox(height: 24),

              const Text(
                'Welcome to\nQent',
                style: TextStyle(
                  fontSize: 45,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),

              const Spacer(),

              CustomButton(
                color: const Color(0xff21292B),
                text: 'Next',
                textColor: Colors.white,
                onpressed: onNext,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
