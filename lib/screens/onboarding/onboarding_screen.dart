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
          ElevatedButton(
            onPressed: () {
              if (isLastPage) {
                // navigate to home, login, etc.
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (_) => const Placeholder()),
                );
              } else {
                _controller.nextPage(
                  duration: const Duration(milliseconds: 400),
                  curve: Curves.easeInOut,
                );
              }
            },
            style: ElevatedButton.styleFrom(
              minimumSize: const Size(double.infinity, 50),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(isLastPage ? "Get Started" : "Next"),
                const SizedBox(width: 8),
                // 👇 Show different icons based on isLastPage
                Icon(
                  isLastPage
                      ? Icons.arrow_forward_ios_rounded
                      : Icons.navigate_next_rounded,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
