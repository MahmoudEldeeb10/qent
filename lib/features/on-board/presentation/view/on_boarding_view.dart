import 'package:flutter/material.dart';
import 'package:qent/features/on-board/presentation/view/widgets/first_view.dart';
import 'package:qent/features/on-board/presentation/view/widgets/second_view.dart';

class OnboardingView extends StatefulWidget {
  const OnboardingView({super.key});

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(children: const [FirstView(), SecondView()]),
    );
  }
}
