import 'package:flutter/material.dart';
import 'package:qent/features/on-board/presentation/view/widgets/animated_dot_container.dart';
import 'package:qent/features/on-board/presentation/view/widgets/first_view.dart';
import 'package:qent/features/on-board/presentation/view/widgets/second_view.dart';

class OnboardingView extends StatefulWidget {
  const OnboardingView({super.key});

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  final PageController _pageController = PageController();
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _pageController,
            onPageChanged: (index) {
              setState(() => currentIndex = index);
            },
            children: [
              FirstView(
                onNext: () {
                  _pageController.nextPage(
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.easeInOut,
                  );
                },
              ),
              const SecondView(),
            ],
          ),

          Positioned(
            bottom: 100,
            left: 0,
            right: 0,
            child: Center(
              child: AnimatedDotContainer(
                count: 2,
                activeIndex: currentIndex,
                activeColor: Colors.white,
                inactiveColor: Colors.white54,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
