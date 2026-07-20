import 'package:flutter/material.dart';

import '../../core/theme/app_spacing.dart';
import '../../widgets/cards/glass_card.dart';
import '../../widgets/gradient_background.dart';
import 'widgets/auth_header.dart';
import 'widgets/register_form.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen>
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
                constraints: const BoxConstraints(
                  maxWidth: 430,
                ),
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
                              title: "Create Account",
                              subtitle: "Join Smart Healthcare",
                            ),
                            SizedBox(height: AppSpacing.xxl),
                            RegisterForm(),
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
