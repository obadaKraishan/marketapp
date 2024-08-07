// lib/presentation/screens/onboarding/onboarding_screen.dart

import 'package:flutter/material.dart';

class OnboardingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Center(
        child: Text(
          'Welcome to GrocerEase',
          style: Theme.of(context).textTheme.headlineLarge?.copyWith(color: Colors.white),
        ),
      ),
    );
  }
}
