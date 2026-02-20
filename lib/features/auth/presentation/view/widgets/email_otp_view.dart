import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qent/appnavigator.dart';
import 'package:qent/constants.dart';
import 'package:qent/core/widgets/custom_button.dart';
import 'package:qent/features/auth/data/services/auth_service.dart';
import 'package:qent/features/auth/presentation/manager/auth%20cubit/auth_cubit.dart';
import 'package:qent/features/auth/presentation/view/new_password_view.dart';
import 'package:qent/features/auth/presentation/view/widgets/otp_fields.dart';

class EmailOtpView extends StatefulWidget {
  final String email;
  final String resetCode;
  final String resetToken;

  const EmailOtpView({
    super.key,
    required this.email,
    required this.resetCode,
    required this.resetToken,
  });

  @override
  State<EmailOtpView> createState() => _EmailOtpViewState();
}

class _EmailOtpViewState extends State<EmailOtpView> {
  String _otpCode = '';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => AuthCubit(AuthService()),
      child: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is ForgotPasswordSuccess) {
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
                  Image.asset(
                    'assets/images/black_logo.png',
                    width: 100,
                    height: 100,
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
                        'We have sent the code to ${widget.email}',
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
                        text: 'Continue',
                        color: AppColors.btn_color,
                        textColor: Colors.white,
                        onpressed: () {
                          if (_otpCode.length < 4) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text('Please enter the complete code'),
                              ),
                            );
                            return;
                          }
                          if (_otpCode == widget.resetCode) {
                            AppNavigator.goToAndClearStack(
                              context,
                              NewPasswordView(
                                resetCode: _otpCode,
                                resetToken: widget.resetToken, // ✅
                              ), // ✅ الكود اللي كتبه اليوزر
                            );
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text('Invalid code, please try again'),
                                backgroundColor: Colors.red,
                              ),
                            );
                          }
                        },
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
                                    context.read<AuthCubit>().forgotPassword(
                                      email: widget.email,
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
