import 'dart:math';
import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_radius.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../core/theme/app_text_styles.dart';

class PharmacyReservationSheet extends StatefulWidget {
  final String pharmacyName;
  final String pharmacyAddress;

  const PharmacyReservationSheet({
    super.key,
    required this.pharmacyName,
    required this.pharmacyAddress,
  });

  @override
  State<PharmacyReservationSheet> createState() => _PharmacyReservationSheetState();
}

class _PharmacyReservationSheetState extends State<PharmacyReservationSheet> {
  late String _pickupCode;
  bool _isReserved = false;

  @override
  void initState() {
    super.initState();
    final rng = Random();
    _pickupCode = (100000 + rng.nextInt(900000)).toString();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF0F172A),
        borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
        border: Border.all(color: AppColors.secondary.withValues(alpha: 0.2), width: 1.5),
      ),
      padding: const EdgeInsets.all(AppSpacing.xl),
      child: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Center(
              child: Container(
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.2),
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
            ),
            const SizedBox(height: AppSpacing.lg),

            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: AppColors.secondary.withValues(alpha: 0.12),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(Icons.qr_code_2_rounded, color: AppColors.secondary, size: 26),
                ),
                const SizedBox(width: AppSpacing.md),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "1-Click Medicine Reservation",
                        style: AppTextStyles.title.copyWith(fontWeight: FontWeight.bold, fontSize: 17),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        widget.pharmacyName,
                        style: AppTextStyles.caption.copyWith(color: AppColors.secondary, fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            const SizedBox(height: AppSpacing.lg),

            // Stylized QR Pass Card
            Container(
              padding: const EdgeInsets.all(AppSpacing.lg),
              decoration: BoxDecoration(
                color: AppColors.card,
                borderRadius: BorderRadius.circular(AppRadius.large),
                border: Border.all(color: Colors.white.withValues(alpha: 0.08)),
              ),
              child: Column(
                children: [
                  const Text(
                    "SHOW QR CODE AT PHARMACY PICKUP COUNTER",
                    style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: AppColors.textDisabled, letterSpacing: 1.0),
                  ),
                  const SizedBox(height: AppSpacing.md),

                  // Custom Rendered QR Mock
                  Container(
                    width: 140,
                    height: 140,
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.secondary.withValues(alpha: 0.3),
                          blurRadius: 16,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: CustomPaint(
                      painter: _QrCodePainter(seed: _pickupCode),
                    ),
                  ),

                  const SizedBox(height: AppSpacing.lg),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "PICKUP PIN: ",
                        style: TextStyle(color: AppColors.textSecondary, fontSize: 12, fontWeight: FontWeight.w600),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                        decoration: BoxDecoration(
                          color: AppColors.primary.withValues(alpha: 0.15),
                          borderRadius: BorderRadius.circular(6),
                          border: Border.all(color: AppColors.primary.withValues(alpha: 0.3)),
                        ),
                        child: Text(
                          _pickupCode,
                          style: const TextStyle(color: AppColors.primary, fontSize: 16, fontWeight: FontWeight.bold, letterSpacing: 2.0),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: AppSpacing.xl),

            ElevatedButton(
              onPressed: _isReserved
                  ? null
                  : () {
                      setState(() => _isReserved = true);
                      Navigator.pop(context);
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text("Reserved at ${widget.pharmacyName}! PIN: $_pickupCode"),
                          backgroundColor: AppColors.success,
                          duration: const Duration(seconds: 3),
                        ),
                      );
                    },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.secondary,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppRadius.medium)),
              ),
              child: Text(
                _isReserved ? "RESERVED" : "CONFIRM RESERVATION",
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _QrCodePainter extends CustomPainter {
  final String seed;
  _QrCodePainter({required this.seed});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = const Color(0xFF0F172A);
    final cellSize = size.width / 7;

    // Corner Finder Patterns
    _drawSquare(canvas, paint, 0, 0, cellSize * 2);
    _drawSquare(canvas, paint, size.width - cellSize * 2, 0, cellSize * 2);
    _drawSquare(canvas, paint, 0, size.height - cellSize * 2, cellSize * 2);

    // Random Grid Dots based on seed
    final rng = Random(seed.hashCode);
    for (int r = 0; r < 7; r++) {
      for (int c = 0; c < 7; c++) {
        if ((r < 2 && c < 2) || (r < 2 && c > 4) || (r > 4 && c < 2)) continue;
        if (rng.nextBool()) {
          canvas.drawRect(
            Rect.fromLTWH(c * cellSize + 2, r * cellSize + 2, cellSize - 4, cellSize - 4),
            paint,
          );
        }
      }
    }
  }

  void _drawSquare(Canvas canvas, Paint paint, double x, double y, double size) {
    canvas.drawRect(Rect.fromLTWH(x, y, size, size), paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
