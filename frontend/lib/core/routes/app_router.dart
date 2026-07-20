import 'package:flutter/material.dart';

import '../../screens/auth/login_screen.dart';
import '../../screens/auth/register_screen.dart';
import '../../screens/splash/splash_screen.dart';
import 'app_routes.dart';
import '../../screens/dashboard/dashboard_screen.dart';
import '../../screens/prescriptions/upload/upload_screen.dart';
import '../../screens/prescriptions/details/prescription_details_screen.dart';

class AppRouter {
  AppRouter._();

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.splash:
        return MaterialPageRoute(builder: (_) => const SplashScreen());

      case AppRoutes.login:
        return _buildAnimatedRoute(const LoginScreen(), settings);

      case AppRoutes.register:
        return _buildAnimatedRoute(const RegisterScreen(), settings);

      case AppRoutes.dashboard:
        return _buildAnimatedRoute(const DashboardScreen(), settings);

      case AppRoutes.uploadPrescription:
        return MaterialPageRoute(builder: (_) => const UploadScreen());

      case AppRoutes.prescriptionDetails:
        return MaterialPageRoute(builder: (_) => const PrescriptionDetailsScreen());

      default:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Center(
              child: Text('Page Not Found'),
            ),
          ),
        );
    }
  }

  // Premium page transition (Fade + Scale)
  static PageRouteBuilder _buildAnimatedRoute(Widget page, RouteSettings settings) {
    return PageRouteBuilder(
      settings: settings,
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionDuration: const Duration(milliseconds: 600),
      reverseTransitionDuration: const Duration(milliseconds: 600),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        final curve = CurvedAnimation(
          parent: animation,
          curve: Curves.easeOutQuart,
          reverseCurve: Curves.easeInQuart,
        );
        return FadeTransition(
          opacity: curve,
          child: ScaleTransition(
            scale: Tween<double>(begin: 0.96, end: 1.0).animate(curve),
            child: child,
          ),
        );
      },
    );
  }
}
