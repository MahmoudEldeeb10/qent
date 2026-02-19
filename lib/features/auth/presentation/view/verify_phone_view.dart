

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qent/constants.dart';
import 'package:qent/core/widgets/custom_button.dart';
import 'package:qent/features/auth/data/services/auth_service.dart';
import 'package:qent/features/auth/presentation/manager/auth%20cubit/auth_cubit.dart';
import 'package:qent/features/auth/presentation/view/phone_otp_view.dart';
import 'package:qent/features/auth/presentation/view/widgets/country_box.dart';
import 'package:qent/features/auth/presentation/view/widgets/custom_text_field.dart';

class VerifyPhoneView extends StatefulWidget {
  final String phone; // استقبل الرقم من signup
  const VerifyPhoneView({super.key, required this.phone});

  @override
  State<VerifyPhoneView> createState() => _VerifyPhoneViewState();}

class _VerifyPhoneViewState extends State<VerifyPhoneView> {
  late TextEditingController phoneController;

  @override
  void initState() {
    super.initState();
    phoneController = TextEditingController(text: widget.phone); // ملي الرقم تلقائي
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(AuthService()),
      child: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
if (state is AuthSuccess) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => OtpView(
          phone: phoneController.text.trim(),
          verifyToken: state.verifyToken ?? '', // ✅ مرر الـ token
        ),
      ),
    );
  }

          if (state is AuthFailure) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.message), backgroundColor: Colors.red),
            );
          }
        },
        builder: (context, state) {
          return Scaffold(
            body: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Image.asset('assets/images/black_logo.png', width: 100, height: 100),
                  Spacer(),
                  Column(
                    children: [
                      Text('Verify your phone number',
                          style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold)),
                      SizedBox(height: 16),
                      Text('We will send you an SMS with a verification code',
                          style: TextStyle(fontSize: 14, color: AppColors.text2)),
                      SizedBox(height: 28),
                      country_box(),
                      SizedBox(height: 18),
                      CustomTextField(
                        controller: phoneController,
                        hint: 'Phone Number',
                        keyboardType: TextInputType.phone,
                      ),
                      SizedBox(height: 28),
                      CustomButton(
                        text: state is AuthLoading ? 'Sending...' : 'Continue',
                        onpressed: state is AuthLoading
                            ? () {}
                            : () {
                                context.read<AuthCubit>().requestVerifyCode(
                                      phone: phoneController.text.trim(),
                                    );
                              },
                        color: AppColors.btn_color,
                        textColor: Colors.white,
                      ),
                    ],
                  ),
                  Spacer(),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}






// import 'package:flutter/material.dart';
// import 'package:qent/constants.dart';
// import 'package:qent/core/widgets/custom_button.dart';
// import 'package:qent/features/auth/presentation/view/otp_view.dart';
// import 'package:qent/features/auth/presentation/view/widgets/country_box.dart';
// import 'package:qent/features/auth/presentation/view/widgets/custom_text_field.dart';

// class VerifyPhoneView extends StatefulWidget {
//   const VerifyPhoneView({super.key});

//   @override
//   State<VerifyPhoneView> createState() => _VerifyPhoneViewState();
// }

// class _VerifyPhoneViewState extends State<VerifyPhoneView> {
//   late TextEditingController phoneController;
//   @override
//   void initState() {
//     super.initState();
//     phoneController = TextEditingController();
//   }

//   @override
//   void dispose() {
//     phoneController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.start,
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             //logo
//             Image.asset(
//               'assets/images/black_logo.png',
//               width: 100,
//               height: 100,
//             ),
//             Spacer(),
//             Column(
//               children: [
//                 Text(
//                   'Verify your phone number',
//                   style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
//                 ),
//                 SizedBox(height: 16),
//                 Text(
//                   'We have sent you an SMS with a code to number',
//                   style: TextStyle(fontSize: 14, color: AppColors.text2),
//                 ),
//                 SizedBox(height: 28),

//                 country_box(),
//                 SizedBox(height: 18),
//                 CustomTextField(
//                   controller: phoneController,
//                   hint: 'Phone Number',
//                   keyboardType: TextInputType.phone,
//                 ),

//                 SizedBox(height: 28),
//                 CustomButton(
//                   text: 'Continue',
//                   onpressed: () {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(builder: (context) => OtpView()),
//                     );
//                   },
//                   color: AppColors.btn_color,
//                   textColor: Colors.white,
//                 ),
//               ],
//             ),

//             Spacer(),
//           ],
//         ),
//       ),
//     );
//   }
// }
