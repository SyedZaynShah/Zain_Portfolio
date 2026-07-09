import 'package:flutter/material.dart';
import 'package:polymorphism/core/constants/strings.dart';
import 'package:polymorphism/core/theme/app_tokens.dart';
import 'package:polymorphism/shared/animations/scroll_reveal.dart';

/// A simple portrait displaying the about.png image with premium styling.
///
/// Replaces the fragment portrait with a clean, single-image presentation
/// that maintains the premium aesthetic of the portfolio.
class SimplePortrait extends StatelessWidget {
  const SimplePortrait({super.key});

  @override
  Widget build(BuildContext context) => ScrollReveal(
    direction: ScrollRevealDirection.left,
    offset: 40,
    delay: AppDurations.instant,
    child: Semantics(
      image: true,
      label: 'Portrait of ${AppStrings.ownerFullName}',
      child: AspectRatio(
        aspectRatio: 4 / 5,
        child: DecoratedBox(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(Radii.lg),
            boxShadow: [
              BoxShadow(
                color: AppColors.deepSpace.withValues(alpha: 0.5),
                blurRadius: 32,
                offset: const Offset(0, 16),
              ),
              BoxShadow(
                color: AppColors.accentPrimary.withValues(alpha: 0.1),
                blurRadius: 48,
                offset: const Offset(0, 8),
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(Radii.lg),
            child: Stack(
              children: [
                // Main portrait image
                Positioned.fill(
                  child: Image.asset(
                    'assets/images/about.png',
                    fit: BoxFit.cover,
                  ),
                ),
                // Subtle gradient overlay for depth
                Positioned.fill(
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.transparent,
                          AppColors.deepSpace.withValues(alpha: 0.2),
                        ],
                        stops: const [0.6, 1.0],
                      ),
                    ),
                  ),
                ),
                // Border accent
                Positioned.fill(
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Radii.lg),
                      border: Border.all(
                        color: AppColors.accentPrimary.withValues(alpha: 0.2),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ),
  );
}
