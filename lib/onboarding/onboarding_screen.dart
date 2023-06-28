import 'package:flutter/material.dart';
import 'package:hao_app/routing/app_state_manager.dart';
import 'package:hao_app/widgets/gradient_button.dart';
import 'package:provider/provider.dart';

import '../routing/app_routes.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});
  static MaterialPage page() {
    return MaterialPage(
      name: AppRoutes.onboardingPath,
      key: ValueKey(AppRoutes.onboardingPath),
      child: const OnboardingScreen(),
    );
  }

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final theme = Theme.of(context);
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: size.height,
            width: size.width,
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/onboarding/chat2.jpg'),
                  fit: BoxFit.cover,
                  colorFilter:
                      ColorFilter.mode(Colors.black45, BlendMode.darken)),
            ),
          ),
          Positioned(
            bottom: 0,
            child: Container(
              // height: 100,
              width: size.width,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(20),
                    topLeft: Radius.circular(20)),
                color:
                    const Color.fromARGB(255, 128, 131, 129).withOpacity(0.5),
              ),
              child: Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      "Find a Comfortable place for you",
                      textAlign: TextAlign.center,
                      style: theme.textTheme.headlineLarge?.copyWith(
                        color: Colors.white,
                        fontSize: 30,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy.",
                      textAlign: TextAlign.center,
                      style: theme.textTheme.headlineLarge?.copyWith(
                        color: Colors.white,
                        fontSize: 15,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  GestureDetector(
                    onTap: () {
                      Provider.of<AppStateManager>(context, listen: false)
                          .setOnBoardingStatus = true;
                    },
                    child: const GradientButton(
                      title: "Get Started",
                      height: 50,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
