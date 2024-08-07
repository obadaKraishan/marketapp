// lib/config/app_router.dart

import 'package:flutter/material.dart';
import 'package:marketapp/presentation/screens/auth/login_screen.dart';
import 'package:marketapp/presentation/screens/auth/register_screen.dart';
import 'package:marketapp/presentation/screens/home/home_screen.dart';
// Import other screens...

class AppRouter {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => HomeScreen());
    // Add other routes...
      default:
        return MaterialPageRoute(builder: (_) => HomeScreen());
    }
  }
}
