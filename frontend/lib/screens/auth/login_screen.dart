import 'package:flutter/material.dart';

import '../../core/theme/app_spacing.dart';
import '../../widgets/gradient_background.dart';
import '../../widgets/cards/glass_card.dart';
import 'widgets/auth_header.dart';
import 'widgets/login_form.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animCtrl;
  late Animation<double> _fadeAnim;
  late Animation<Offset> _slideAnim;

  @override
  void initState() {
    super.initState();
    _animCtrl = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );

    _fadeAnim = CurvedAnimation(
      parent: _animCtrl,
      curve: const Interval(0.0, 0.8, curve: Curves.easeOut),
    );

    _slideAnim = Tween<Offset>(
      begin: const Offset(0, 0.1),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _animCtrl,
      curve: const Interval(0.0, 1.0, curve: Curves.easeOutCubic),
    ));

    _animCtrl.forward();
  }

  @override
  void dispose() {
    _animCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GradientBackground(
        child: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(
                horizontal: AppSpacing.lg,
                vertical: AppSpacing.xl,
              ),
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 430),
                child: FadeTransition(
                  opacity: _fadeAnim,
                  child: SlideTransition(
                    position: _slideAnim,
                    child: SizedBox(
                      height: 680,
                      child: GlassCard(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: const [
                            AuthHeader(
                              title: "Welcome Back",
                              subtitle: "Sign in to continue to MediSync",
                            ),
                            SizedBox(height: AppSpacing.xxl),
                            LoginForm(),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
