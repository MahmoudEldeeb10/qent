import 'package:flutter/material.dart';
import 'package:qent/features/on-board/presentation/view/on_boarding_view.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: OnboardingView());
  }
}
