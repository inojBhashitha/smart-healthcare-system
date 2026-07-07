import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'core/routes/app_router.dart';
import 'core/routes/app_routes.dart';
import 'core/theme/app_theme.dart';
import 'providers/auth_provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => AuthProvider(),
        ),
      ],
      child: const SmartHealthcareApp(),
    ),
  );
}

class SmartHealthcareApp extends StatelessWidget {
  const SmartHealthcareApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Smart Healthcare',

      debugShowCheckedModeBanner: false,

      theme: AppTheme.darkTheme,

      initialRoute: AppRoutes.splash,

      onGenerateRoute: AppRouter.generateRoute,
    );
  }
}