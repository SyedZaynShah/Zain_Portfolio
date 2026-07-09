import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:polymorphism/core/theme/app_tokens.dart';
import 'package:polymorphism/data/portfolio_data.dart';
import 'package:polymorphism/features/shell/portfolio_shell.dart';
import 'package:polymorphism/features/works/project_detail.dart';

/// URL routing.
///
/// - `/` — the single-scroll portfolio.
/// - `/work/:id` — fullscreen project detail (deep-linkable; unknown ids
///   redirect home). Pushed on top of the shell so the shell's scroll
///   position is preserved, entering with a fade + slide. The page is keyed
///   by project id so per-project state (gallery index, live toggle, scroll
///   offset) resets when navigating straight to the next project.
class AppRouter {
  AppRouter._();

  static final GoRouter router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const PortfolioShell(),
        routes: [
          GoRoute(
            path: 'work/:id',
            redirect:
                (context, state) =>
                    PortfolioData.projectById(
                              state.pathParameters['id'] ?? '',
                            ) ==
                            null
                        ? '/'
                        : null,
            pageBuilder: (context, state) {
              final project =
                  PortfolioData.projectById(state.pathParameters['id']!)!;
              return CustomTransitionPage(
                key: state.pageKey,
                transitionDuration: AppDurations.slow,
                reverseTransitionDuration: AppDurations.normal,
                child: ProjectDetailPage(
                  key: ValueKey(project.id),
                  project: project,
                ),
                transitionsBuilder: (
                  context,
                  animation,
                  secondaryAnimation,
                  child,
                ) {
                  final eased = CurvedAnimation(
                    parent: animation,
                    curve: AppCurves.travel,
                  );
                  return FadeTransition(
                    opacity: eased,
                    child: SlideTransition(
                      position: Tween<Offset>(
                        begin: const Offset(0, 0.04),
                        end: Offset.zero,
                      ).animate(eased),
                      child: child,
                    ),
                  );
                },
              );
            },
          ),
        ],
      ),
    ],
    errorBuilder: (context, state) => const PortfolioShell(),
  );
}
