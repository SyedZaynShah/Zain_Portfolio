import 'package:flutter/material.dart';
import 'package:polymorphism/core/theme/app_tokens.dart';
import 'package:polymorphism/core/theme/app_typography.dart';

/// Mono-faced tech/stack chip — `FLUTTER`, `REST APIS`, …
///
/// Informational, not tappable: hover only warms the fill/border, with no
/// scale, so it never reads as a button.
class TechBadge extends StatefulWidget {
  const TechBadge(this.label, {super.key});

  final String label;

  @override
  State<TechBadge> createState() => _TechBadgeState();
}

class _TechBadgeState extends State<TechBadge> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) => MouseRegion(
    onEnter: (_) => setState(() => _hovered = true),
    onExit: (_) => setState(() => _hovered = false),
    child: AnimatedContainer(
      duration: AppDurations.fast,
      curve: AppCurves.enter,
      padding: const EdgeInsets.symmetric(
        horizontal: Spacing.md,
        vertical: Spacing.sm,
      ),
      decoration: BoxDecoration(
        color: _hovered ? AppColors.accentSubtle : AppColors.surfaceCard,
        borderRadius: BorderRadius.circular(Radii.pill),
        border: Border.all(
          color: _hovered ? AppColors.borderActive : AppColors.borderSubtle,
        ),
      ),
      child: Text(
        widget.label.toUpperCase(),
        style: AppTypography.badge.copyWith(
          color: _hovered ? AppColors.textAccent : AppColors.textSecondary,
        ),
      ),
    ),
  );
}
