import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:polymorphism/core/constants/strings.dart';
import 'package:polymorphism/core/theme/app_tokens.dart';
import 'package:polymorphism/core/theme/app_typography.dart';
import 'package:polymorphism/core/utils/extensions.dart';
import 'package:polymorphism/core/utils/responsive.dart';
import 'package:polymorphism/data/portfolio_data.dart';
import 'package:polymorphism/features/works/widgets/bento_card.dart';
import 'package:polymorphism/shared/animations/scroll_reveal.dart';
import 'package:polymorphism/shared/widgets/cta_button.dart';
import 'package:polymorphism/shared/widgets/hover_card.dart';
import 'package:polymorphism/shared/widgets/section_header.dart';

/// 02 / WORKS — an asymmetric bento grid of real, shipped projects.
///
/// Desktop is a 3-row editorial layout: a big featured cell beside a stacked
/// pair, then a small cell beside a featured one, then a row of small cells and
/// the closing invite. Each cell 3D-tilts on hover and opens its case study on
/// press. Tablet pairs the cells; mobile is a single column.
class WorksSection extends StatelessWidget {
  const WorksSection({
    required this.onOpenProject,
    required this.onStartProject,
    super.key,
  });

  final void Function(String projectId) onOpenProject;
  final VoidCallback onStartProject;

  @override
  Widget build(BuildContext context) => Container(
    width: double.infinity,
    padding: EdgeInsets.symmetric(
      horizontal: context.pageGutter,
      vertical: context.sectionSpacing,
    ),
    child: Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: Spacing.pageMaxWidth),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SectionHeader(
              eyebrow: AppStrings.worksEyebrow,
              title: AppStrings.worksTitle,
              subtitle: AppStrings.worksSubtitle,
            ),
            SizedBox(
              height: context.responsive(
                mobile: Spacing.xl,
                desktop: Spacing.xxl,
              ),
            ),
            context.responsive<Widget>(
              mobile: _singleColumn(),
              tablet: _tabletGrid(),
              desktop: _bentoGrid(context),
            ),
          ],
        ),
      ),
    ),
  );

  // project order: 0 modchat · 1 elssa · 2 fitx · 3 fe-touch · 4 balai

  Widget _cell(
    int index,
    int order, {
    bool featured = false,
    bool compact = false,
  }) {
    final project = PortfolioData.projects[index];
    return ScrollReveal(
      delay: Duration(milliseconds: order * 70),
      direction: ScrollRevealDirection.scale,
      child: BentoCard(
        project: project,
        featured: featured,
        compact: compact,
        onOpen: () => onOpenProject(project.id),
      ),
    );
  }

  Widget _ctaCell(int order) => ScrollReveal(
    delay: Duration(milliseconds: order * 70),
    direction: ScrollRevealDirection.scale,
    child: _BentoCtaTile(onTap: onStartProject),
  );

  /// Desktop: the asymmetric editorial bento.
  Widget _bentoGrid(BuildContext context) {
    final tall = context.isWide ? 480.0 : 440.0;
    const gap = Spacing.gridGap;
    return Column(
      children: [
        // Row 1: Featured ModChat (left 2/3) + stacked ELSSA and FitX (right 1/3)
        SizedBox(
          height: tall,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(flex: 2, child: _cell(0, 0, featured: true)), // ModChat
              const SizedBox(width: gap),
              Expanded(
                child: Column(
                  children: [
                    Expanded(child: _cell(1, 1, compact: true)), // ELSSA
                    const SizedBox(height: gap),
                    Expanded(child: _cell(2, 2, compact: true)), // FitX
                  ],
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: gap),
        // Row 2: FE Touch (left 1/2), Balai (right 1/2), CTA (right after)
        SizedBox(
          height: context.isWide ? 360 : 340,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(child: _cell(3, 3)), // FE Touch
              const SizedBox(width: gap),
              Expanded(child: _cell(4, 4)), // Balai
              const SizedBox(width: gap),
              Expanded(child: _ctaCell(5)),
            ],
          ),
        ),
      ],
    );
  }

  /// Tablet: featured cells full-width, the rest paired.
  Widget _tabletGrid() {
    const gap = Spacing.gridGap;
    return Column(
      children: [
        // Featured ModChat full width
        SizedBox(height: 380, child: _cell(0, 0, featured: true)),
        const SizedBox(height: gap),
        // ELSSA and FitX paired
        SizedBox(
          height: 330,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(child: _cell(1, 1)), // ELSSA
              const SizedBox(width: gap),
              Expanded(child: _cell(2, 2)), // FitX
            ],
          ),
        ),
        const SizedBox(height: gap),
        // FE Touch and Balai paired
        SizedBox(
          height: 320,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(child: _cell(3, 3)), // FE Touch
              const SizedBox(width: gap),
              Expanded(child: _cell(4, 4)), // Balai
            ],
          ),
        ),
        const SizedBox(height: gap),
        // CTA full width
        SizedBox(height: 200, child: _ctaCell(5)),
      ],
    );
  }

  /// Mobile: one column.
  Widget _singleColumn() {
    const gap = Spacing.gridGap;
    final n = PortfolioData.projects.length;
    return Column(
      children: [
        for (var i = 0; i < n; i++) ...[
          SizedBox(
            height: PortfolioData.projects[i].isPortraitMedia ? 420 : 340,
            child: _cell(i, i, featured: PortfolioData.projects[i].isFeatured),
          ),
          const SizedBox(height: gap),
        ],
        SizedBox(height: 220, child: _ctaCell(n)),
      ],
    );
  }
}

/// The closing grid cell — an invitation, not a project.
class _BentoCtaTile extends StatefulWidget {
  const _BentoCtaTile({required this.onTap});

  final VoidCallback onTap;

  @override
  State<_BentoCtaTile> createState() => _BentoCtaTileState();
}

class _BentoCtaTileState extends State<_BentoCtaTile> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) => RepaintBoundary(
    child: HoverCard(
      onTap: widget.onTap,
      onHoverChanged: (h) => setState(() => _hovered = h),
      child: AnimatedContainer(
        duration: AppDurations.normal,
        curve: AppCurves.enter,
        padding: const EdgeInsets.all(Spacing.lg),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Radii.lg),
          border: Border.all(
            color: _hovered ? AppColors.borderActive : AppColors.borderSubtle,
            width: 0.8,
          ),
          gradient: const RadialGradient(
            center: Alignment(0.9, 1),
            radius: 1.6,
            colors: [AppColors.accentSubtle, Colors.transparent],
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('NEXT', style: AppTypography.monoAccent),
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    AppStrings.nextProjectCardTitle,
                    style: AppTypography.titleM,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: Spacing.sm),
                  Flexible(
                    child: Text(
                      AppStrings.nextProjectCardBody,
                      style: AppTypography.bodyM.copyWith(fontSize: 13),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const SizedBox(height: Spacing.md),
                  CtaButton.ghost(
                    label: AppStrings.nextProjectCardCta,
                    icon: LucideIcons.arrowUpRight,
                    onTap: widget.onTap,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
