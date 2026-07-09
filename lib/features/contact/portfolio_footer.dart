import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:polymorphism/core/constants/assets.dart';
import 'package:polymorphism/core/constants/strings.dart';
import 'package:polymorphism/core/theme/app_tokens.dart';
import 'package:polymorphism/core/theme/app_typography.dart';
import 'package:polymorphism/core/utils/extensions.dart';
import 'package:polymorphism/core/utils/responsive.dart';
import 'package:polymorphism/data/portfolio_data.dart';
import 'package:polymorphism/shared/widgets/custom_cursor.dart';
import 'package:url_launcher/url_launcher.dart';

/// Footer: copyright · live Abbottabad clock · socials · logo mark.
class PortfolioFooter extends StatefulWidget {
  const PortfolioFooter({super.key});

  @override
  State<PortfolioFooter> createState() => _PortfolioFooterState();
}

class _PortfolioFooterState extends State<PortfolioFooter> {
  Timer? _timer;
  String _abbottabadTime = '';

  @override
  void initState() {
    super.initState();
    _tick();
    // Minute precision is plenty — 60× fewer rebuilds than per-second.
    _timer = Timer.periodic(const Duration(seconds: 20), (_) => _tick());
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _tick() {
    final abbottabad = DateTime.now().toUtc().add(const Duration(hours: 5));
    // 12-hour clock with AM/PM — equivalent to DateFormat('h:mm a').
    final h12 = abbottabad.hour % 12 == 0 ? 12 : abbottabad.hour % 12;
    final minute = abbottabad.minute.toString().padLeft(2, '0');
    final period = abbottabad.hour < 12 ? 'AM' : 'PM';
    final next = '$h12:$minute $period';
    if (next != _abbottabadTime && mounted) {
      setState(() => _abbottabadTime = next);
    }
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = context.isMobile;
    final meta = AppTypography.caption.copyWith(color: AppColors.textSecondary);

    return DecoratedBox(
      decoration: const BoxDecoration(
        color: AppColors.inkBlack,
        border: Border(top: BorderSide(color: AppColors.borderSubtle)),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: context.pageGutter,
          vertical: Spacing.xl,
        ),
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: Spacing.pageMaxWidth),
            child: Column(
              children: [
                Wrap(
                  alignment:
                      isMobile
                          ? WrapAlignment.center
                          : WrapAlignment.spaceBetween,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  spacing: Spacing.lg,
                  runSpacing: Spacing.md,
                  children: [
                    Text(AppStrings.footerCopyright, style: meta),
                    Text('Abbottabad $_abbottabadTime', style: meta),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(AppStrings.footerBuiltWith, style: meta),
                        const SizedBox(width: Spacing.xs),
                        const Icon(
                          LucideIcons.heart,
                          size: 12,
                          color: AppColors.accentPrimary,
                        ),
                      ],
                    ),
                    Wrap(
                      spacing: Spacing.md,
                      children: [
                        for (final social in PortfolioData.socials)
                          _FooterSocial(label: social.label, url: social.url),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: Spacing.lg),
                Image.asset(
                  AppAssets.logo,
                  height: isMobile ? 36 : 48,
                  color: AppColors.textMuted,
                  errorBuilder:
                      (context, error, stackTrace) => Text(
                        'Z.',
                        style: AppTypography.titleM.copyWith(
                          color: AppColors.textMuted,
                        ),
                      ),
                ),
                const SizedBox(height: Spacing.sm),
                Text(
                  AppStrings.footerTagline,
                  style: AppTypography.caption.copyWith(
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/// Footer social link — readable at rest, warming to the accent on hover.
class _FooterSocial extends StatefulWidget {
  const _FooterSocial({required this.label, required this.url});

  final String label;
  final String url;

  @override
  State<_FooterSocial> createState() => _FooterSocialState();
}

class _FooterSocialState extends State<_FooterSocial> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) => CursorTarget(
    child: MouseRegion(
      opaque: false,
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: GestureDetector(
        onTap: () => launchUrl(Uri.parse(widget.url)),
        child: Semantics(
          link: true,
          label: widget.label,
          child: AnimatedDefaultTextStyle(
            duration: AppDurations.fast,
            curve: AppCurves.enter,
            style: AppTypography.mono.copyWith(
              color: _hovered ? AppColors.textAccent : AppColors.textSecondary,
            ),
            child: Text(widget.label.toUpperCase()),
          ),
        ),
      ),
    ),
  );
}
