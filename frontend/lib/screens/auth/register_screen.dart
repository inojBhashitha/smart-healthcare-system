import 'package:flutter/material.dart';

import '../../core/theme/app_spacing.dart';
import '../../widgets/cards/glass_card.dart';
import '../../widgets/gradient_background.dart';
import 'widgets/auth_header.dart';
import 'widgets/register_form.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GradientBackground(
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
              child: const GlassCard(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
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
    );
  }
}