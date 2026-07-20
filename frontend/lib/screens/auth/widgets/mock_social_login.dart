import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/routes/app_routes.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_spacing.dart';

class MockSocialLogin {
  static void showAccountSelector(BuildContext context, String provider) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (ctx) => _AccountSelectorSheet(provider: provider),
    );
  }
}

class _AccountSelectorSheet extends StatefulWidget {
  final String provider;
  const _AccountSelectorSheet({required this.provider});

  @override
  State<_AccountSelectorSheet> createState() => _AccountSelectorSheetState();
}

class _AccountSelectorSheetState extends State<_AccountSelectorSheet> {
  bool _isLoggingIn = false;

  void _login() async {
    setState(() => _isLoggingIn = true);
    await Future.delayed(const Duration(milliseconds: 1500));
    if (!mounted) return;
    Navigator.of(context).pop(); // Close sheet
    Navigator.pushReplacementNamed(context, AppRoutes.dashboard);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.card,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
        border: Border.all(
          color: Colors.white.withValues(alpha: 0.1),
          width: 1,
        ),
      ),
      padding: const EdgeInsets.all(AppSpacing.xl),
      child: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: 0.2),
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            const SizedBox(height: AppSpacing.xl),
            
            // Header
            Row(
              children: [
                Icon(
                  widget.provider == 'Google' 
                    ? Icons.g_mobiledata_rounded 
                    : Icons.apple_rounded,
                  size: 32,
                  color: Colors.white,
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Sign in with ${widget.provider}',
                        style: GoogleFonts.inter(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Text(
                        'Choose an account to continue',
                        style: GoogleFonts.inter(
                          color: AppColors.textSecondary,
                          fontSize: 13,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            
            const SizedBox(height: AppSpacing.xxl),
            
            if (_isLoggingIn)
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 40),
                child: Center(
                  child: CircularProgressIndicator(color: AppColors.primary),
                ),
              )
            else
              Column(
                children: [
                  _AccountTile(
                    name: 'John Doe',
                    email: 'john.doe@gmail.com',
                    initials: 'JD',
                    onTap: _login,
                  ),
                  const SizedBox(height: AppSpacing.md),
                  _AccountTile(
                    name: 'Jane Smith',
                    email: 'jane.smith@icloud.com',
                    initials: 'JS',
                    onTap: _login,
                  ),
                  const SizedBox(height: AppSpacing.lg),
                  Divider(color: Colors.white.withValues(alpha: 0.1)),
                  ListTile(
                    leading: const Icon(Icons.person_add_alt_1_rounded, color: AppColors.textSecondary),
                    title: Text(
                      'Use another account',
                      style: GoogleFonts.inter(
                        color: AppColors.textSecondary,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    onTap: () {},
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}

class _AccountTile extends StatelessWidget {
  final String name;
  final String email;
  final String initials;
  final VoidCallback onTap;

  const _AccountTile({
    required this.name,
    required this.email,
    required this.initials,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.white.withValues(alpha: 0.05)),
          color: AppColors.surface.withValues(alpha: 0.3),
        ),
        child: Row(
          children: [
            CircleAvatar(
              radius: 20,
              backgroundColor: AppColors.primary,
              child: Text(
                initials,
                style: GoogleFonts.inter(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                  fontSize: 14,
                ),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: GoogleFonts.inter(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 15,
                    ),
                  ),
                  Text(
                    email,
                    style: GoogleFonts.inter(
                      color: AppColors.textSecondary,
                      fontSize: 13,
                    ),
                  ),
                ],
              ),
            ),
            const Icon(Icons.chevron_right_rounded, color: AppColors.textSecondary),
          ],
        ),
      ),
    );
  }
}
