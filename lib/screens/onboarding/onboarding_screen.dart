import 'package:flutter/material.dart';
import "./widget/onboarding_page.dart";
import "./widget/page_indicator.dart";

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _controller = PageController();
  bool isLastPage = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView(
              controller: _controller,
              onPageChanged: (index) {
                setState(() => isLastPage = index == 2);
              },
              children: const [
                OnboardingPage(
                  // image: 'assets/images/onboard1.png',
                  title: 'Welcome!',
                  description: 'Discover Flutter’s power.',
                ),
                OnboardingPage(
                  // image: 'assets/images/onboard2.png',
                  title: 'Fast Development',
                  description: 'Build apps efficiently.',
                ),
                OnboardingPage(
                  // image: 'assets/images/onboard3.png',
                  title: 'Get Started',
                  description: 'Let’s begin your journey!',
                ),
              ],
            ),
          ),

          OnboardingIndicator(controller: _controller, count: 3),

          const SizedBox(height: 20),

          Column(
            children: [
              Icon(
                isLastPage ? Icons.arrow_forward_ios : Icons.arrow_back_ios_new,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
