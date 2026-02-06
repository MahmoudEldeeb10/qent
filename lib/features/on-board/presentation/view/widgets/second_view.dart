import 'package:flutter/material.dart';
import 'package:qent/core/widgets/custom_button.dart';
import 'package:qent/features/auth/presentation/view/login_view.dart';

class SecondView extends StatelessWidget {
  const SecondView({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: Image.asset(
            'assets/images/background_img_2.png',
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

              Image.asset('assets/images/car icon.png', width: 60, height: 60),

              const SizedBox(height: 24),

              const Text(
                'Lets Start \nA New Experience \nWith Car rental.',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),

              Spacer(),
              Text(
                'Discover your next adventure with Qent. we’re here to \nprovide you with a seamless car rental experience. \nLet’s get started on your journey.',

                style: TextStyle(color: Colors.white),
              ),
              SizedBox(height: 40),

              CustomButton(
                text: 'Get Started',
                textColor: Colors.white,

                onpressed: () {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => const LoginView()),
                    (route) => false,
                  );
                },
                color: Color(0xff21292B),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
