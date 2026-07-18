import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'core/routes/app_router.dart';
import 'core/routes/app_routes.dart';
import 'core/theme/app_theme.dart';
import 'providers/auth_provider.dart';
import 'providers/prescription_provider.dart';

import 'core/services/console_logger.dart';
import 'core/services/notification_service.dart';
import 'core/widgets/responsive_device_frame.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => AuthProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => PrescriptionProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => ConsoleLogger(),
        ),
        ChangeNotifierProvider(
          create: (_) => NotificationService(),
        ),
      ],
      child: const SmartHealthcareApp(),
    ),
  );
}

class SmartHealthcareApp extends StatelessWidget {
  static final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  const SmartHealthcareApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Smart Healthcare',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.darkTheme,
      navigatorKey: navigatorKey,
      initialRoute: AppRoutes.splash,
      onGenerateRoute: AppRouter.generateRoute,
      navigatorObservers: [
        ConsoleNavigationObserver(),
      ],
      builder: (context, child) {
        return ResponsiveDeviceFrame(
          navigatorKey: navigatorKey,
          child: child!,
        );
      },
    );
  }
}