import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../core/theme/app_colors.dart';
import '../../core/theme/app_gradients.dart';
import '../loading/loading_indicator.dart';

class CustomButton extends StatefulWidget {
  final String text;
  final IconData? icon;
  final bool isLoading;
  final VoidCallback? onPressed;
  final bool outlined;
  final Color? color;

  const CustomButton({
    super.key,
    required this.text,
    this.icon,
    this.isLoading = false,
    this.onPressed,
    this.outlined = false,
    this.color,
  });

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  double _scale = 1.0;

  @override
  Widget build(BuildContext context) {
    final enabled = widget.onPressed != null && !widget.isLoading;
    return GestureDetector(
      onTapDown: enabled ? (_) => setState(() => _scale = 0.96) : null,
      onTapUp: enabled
          ? (_) {
              setState(() => _scale = 1.0);
              widget.onPressed!();
            }
          : null,
      onTapCancel: enabled ? () => setState(() => _scale = 1.0) : null,
      child: AnimatedScale(
        duration: const Duration(milliseconds: 140),
        curve: Curves.easeOutBack,
        scale: _scale,
        child: AnimatedOpacity(
          duration: const Duration(milliseconds: 150),
          opacity: enabled ? 1.0 : 0.55,
          child: widget.outlined ? _outlined() : _filled(),
        ),
      ),
    );
  }

  Widget _filled() {
    return Container(
      width: double.infinity,
      height: 56,
      decoration: BoxDecoration(
        gradient: widget.color != null
            ? LinearGradient(colors: [widget.color!, widget.color!])
            : AppGradients.primary,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: AppColors.primary.withValues(alpha: 0.40),
            blurRadius: 24,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Center(child: _label(Colors.white)),
    );
  }

  Widget _outlined() {
    final c = widget.color ?? AppColors.primary;
    return Container(
      width: double.infinity,
      height: 56,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: c, width: 1.5),
        color: c.withValues(alpha: 0.06),
      ),
      child: Center(child: _label(c)),
    );
  }

  Widget _label(Color color) {
    return widget.isLoading
        ? LoadingIndicator(size: 22, color: color)
        : Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (widget.icon != null) ...[
                Icon(widget.icon, color: color, size: 18),
                const SizedBox(width: 8),
              ],
              Text(
                widget.text,
                style: GoogleFonts.inter(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: color,
                  letterSpacing: -0.2,
                ),
              ),
            ],
          );
  }
}
