import 'package:flutter/material.dart';
import 'package:polymorphism/core/theme/app_tokens.dart';
import 'package:polymorphism/core/theme/app_typography.dart';
import 'package:polymorphism/shared/widgets/custom_cursor.dart';
import 'package:polymorphism/shared/widgets/keyhole_reveal.dart';
import 'package:polymorphism/shared/widgets/magnetic_button.dart';

/// Call-to-action buttons.
///
/// - [CtaButton.primary] — accent outline; fills with accent on hover and
///   the label flips to dark.
/// - [CtaButton.ghost] — text-only with an animated underline.
///
/// Both scale 1.0 → 1.03 over 200 ms ease-out, are magnetic on desktop,
/// and announce themselves to the custom cursor.
class CtaButton extends StatefulWidget {
  const CtaButton.primary({
    required this.label,
    required this.onTap,
    super.key,
    this.icon,
    this.keyhole = false,
  }) : _primary = true;

  const CtaButton.ghost({
    required this.label,
    required this.onTap,
    super.key,
    this.icon,
    this.keyhole = false,
  }) : _primary = false;

  final String label;
  final VoidCallback onTap;
  final IconData? icon;

  /// Overlay a dark copy of the label clipped to the hero's keyhole reveal, so
  /// the text stays readable where the bright reveal sits behind it.
  final bool keyhole;
  final bool _primary;

  @override
  State<CtaButton> createState() => _CtaButtonState();
}

class _CtaButtonState extends State<CtaButton> {
  bool _hovered = false;
  bool _focused = false; // keyboard focus — shares the hover visual + a ring
  bool _pressed = false; // tactile press feedback (touch + mouse)
  double? _cachedTextWidth;

  /// Hover and keyboard focus drive the same active visual.
  bool get _active => _hovered || _focused;

  void _setPressed(bool v) {
    if (v != _pressed) {
      setState(() => _pressed = v);
    }
  }

  @override
  Widget build(BuildContext context) {
    final labelColor =
        widget._primary
            ? (_active ? AppColors.textOnAccent : AppColors.textAccent)
            : AppColors.textPrimary;

    // When keyhole is on, overlay a black copy of the label clipped to the
    // reveal circle so it reads against the bright background under the cursor.
    final label =
        widget.keyhole
            ? KeyholeReveal(
              revealChild: _label(AppColors.deepSpace),
              child: _label(labelColor),
            )
            : _label(labelColor);

    final body =
        widget._primary
            ? AnimatedContainer(
              duration: AppDurations.fast,
              curve: AppCurves.enter,
              padding: const EdgeInsets.symmetric(
                horizontal: Spacing.lg,
                vertical: Spacing.md,
              ),
              decoration: BoxDecoration(
                color: _active ? AppColors.accentPrimary : Colors.transparent,
                borderRadius: BorderRadius.circular(Radii.pill),
                border: Border.all(color: AppColors.accentPrimary),
                boxShadow:
                    _active
                        ? const [
                          BoxShadow(
                            color: AppColors.accentSubtle,
                            blurRadius: 24,
                            spreadRadius: 4,
                          ),
                        ]
                        : const [],
              ),
              child: label,
            )
            : Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: Spacing.sm,
                vertical: Spacing.md,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  label,
                  const SizedBox(height: 3),
                  // Underline sweeps in from the left.
                  AnimatedContainer(
                    duration: AppDurations.fast,
                    curve: AppCurves.enter,
                    height: 1.5,
                    width: _active ? _textWidth(context) : 0,
                    color: AppColors.accentPrimary,
                  ),
                ],
              ),
            );

    return CursorTarget(
      child: Semantics(
        button: true,
        label: widget.label,
        child: FocusableActionDetector(
          actions: <Type, Action<Intent>>{
            ActivateIntent: CallbackAction<ActivateIntent>(
              onInvoke: (_) {
                widget.onTap();
                return null;
              },
            ),
          },
          onShowFocusHighlight: (v) => setState(() => _focused = v),
          child: MouseRegion(
            opaque: false,
            onEnter: (_) => setState(() => _hovered = true),
            onExit: (_) => setState(() => _hovered = false),
            // Listener observes presses without claiming the gesture, so
            // MagneticButton's tap still fires — adds tactile feedback on touch.
            child: Listener(
              onPointerDown: (_) => _setPressed(true),
              onPointerUp: (_) => _setPressed(false),
              onPointerCancel: (_) => _setPressed(false),
              child: MagneticButton(
                onTap: widget.onTap,
                child: AnimatedScale(
                  scale: _pressed ? 0.96 : (_active ? 1.03 : 1),
                  duration: AppDurations.fast,
                  curve: AppCurves.enter,
                  child: body,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  /// The label row (text + slide-in icon) in [color]. Built twice for the
  /// keyhole reveal — once light, once dark.
  Widget _label(Color color) => Row(
    mainAxisSize: MainAxisSize.min,
    children: [
      Text(widget.label, style: AppTypography.button.copyWith(color: color)),
      // Icon slides in on hover / focus.
      AnimatedContainer(
        duration: AppDurations.fast,
        curve: AppCurves.enter,
        width: widget.icon != null && _active ? 24 : 0,
        child:
            widget.icon != null
                ? ClipRect(
                  child: AnimatedSlide(
                    duration: AppDurations.fast,
                    curve: AppCurves.enter,
                    offset: _active ? Offset.zero : const Offset(-0.6, 0),
                    child: Icon(widget.icon, size: 16, color: color),
                  ),
                )
                : null,
      ),
    ],
  );

  @override
  void didUpdateWidget(CtaButton oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.label != widget.label) {
      _cachedTextWidth = null;
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // The underline width depends on the ambient text scale — re-measure when
    // it changes.
    _cachedTextWidth = null;
  }

  double _textWidth(BuildContext context) {
    if (_cachedTextWidth != null) {
      return _cachedTextWidth!;
    }
    final painter = TextPainter(
      text: TextSpan(text: widget.label, style: AppTypography.button),
      textDirection: TextDirection.ltr,
      textScaler: MediaQuery.textScalerOf(context),
    )..layout();
    _cachedTextWidth = painter.width;
    painter.dispose();
    return _cachedTextWidth!;
  }
}
