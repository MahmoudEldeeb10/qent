import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qent/appnavigator.dart';
import 'package:qent/constants.dart';
import 'package:qent/core/widgets/custom_button.dart';
import 'package:qent/features/auth/data/services/auth_service.dart';
import 'package:qent/features/auth/presentation/manager/auth%20cubit/auth_cubit.dart';
import 'package:qent/features/auth/presentation/view/login_view.dart';
import 'package:qent/features/auth/presentation/view/widgets/otp_fields.dart';
import 'package:qent/features/home/presentation/view/home_view.dart';

class OtpView extends StatefulWidget {
  final String phone;
  final String verifyToken; 

  const OtpView({super.key, required this.phone, required this.verifyToken});

  @override
  State<OtpView> createState() => _OtpViewState();
}

class _OtpViewState extends State<OtpView> {
  String _otpCode = '';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => AuthCubit(AuthService()),
      child: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is AuthSuccess) {
            AppNavigator.goToAndClearStack(context, LoginView());
          }
          if (state is AuthCodeResent) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Code resent successfully'),
                backgroundColor: Colors.green,
              ),
            );
          }
          if (state is AuthFailure) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.message),
                backgroundColor: Colors.red,
              ),
            );
          }
        },
        builder: (context, state) {
          return Scaffold(
            body: Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Image.asset(
                        'assets/images/black_logo.png',
                        width: 100,
                        height: 100,
                      ),
                      Spacer(),
                      GestureDetector(
                        onTap: () {
                          AppNavigator.goToAndClearStack(context, HomeView());
                        },
                        child: Text(
                          'Skip',
                          style: TextStyle(
                            color: Colors.black54,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),

                  Spacer(flex: 1),

                  Column(
                    children: [
                      Text(
                        'Enter Verification Code',
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 16),
                      Text(
                        'We have sent the code to : ${widget.phone}',
                        style: TextStyle(fontSize: 14, color: AppColors.text2),
                      ),
                      SizedBox(height: 16),

                      otp_fields(
                        onCompleted: (code) {
                          _otpCode = code;
                        },
                      ),

                      SizedBox(height: 16),

                      CustomButton(
                        text: state is AuthLoading
                            ? 'Verifying...'
                            : 'Continue',
                        onpressed: state is AuthLoading
                            ? () {}
                            : () {
                                if (_otpCode.length == 4) {
                                  context.read<AuthCubit>().confirmVerifyCode(
                                    code: _otpCode,
                                    verifyToken: widget.verifyToken, // ✅
                                  );
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        'Please enter the complete code',
                                      ),
                                    ),
                                  );
                                }
                              },
                        color: AppColors.btn_color,
                        textColor: Colors.white,
                      ),

                      SizedBox(height: 16),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Don\'t receive the OTP?  ',
                            style: TextStyle(color: Colors.grey),
                          ),
                          GestureDetector(
                            onTap: state is AuthLoading
                                ? null
                                : () {
                                    context.read<AuthCubit>().resendVerifyCode(
                                      phone: widget.phone, // ✅
                                    );
                                  },
                            child: Text(
                              'Resend',
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),

                  Spacer(flex: 2),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
