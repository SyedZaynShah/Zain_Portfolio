import 'package:flutter/widgets.dart';

/// Every asset path used by the app. No string literals at call sites.
class AppAssets {
  AppAssets._();

  static const String logo = 'assets/images/logo.webp';

  /// Hero portrait layers. [heroForeground] is the composed, low-poly face on
  /// black (the default); [heroBackground] is the colourful, smiling self
  /// surrounded by real work, revealed under the cursor mask.
  static const String heroForeground = 'assets/images/Foreground.jpeg';
  static const String heroBackground = 'assets/images/Background--.webp';

  /// The six B&W "ink-drip" portrait fragments used in the About collage.
  static List<String> get fragments => [
    for (var n = 1; n <= 6; n++) 'assets/images/fragment$n.webp',
  ];

  /// Both hero photos are 3840×2160. Decode them once at a capped width so the
  /// pair doesn't blow the 100 MB image cache, and share the *same* provider
  /// between preload and render so the cache key matches (no double decode).
  static ImageProvider heroProvider(String path) =>
      ResizeImage(AssetImage(path), width: 2048);

  // ── Works gallery ──────────────────────────────────────────────────────
  //
  // Curated real-product imagery: ROAST + FE Touch are real screenshots;
  // ELSSA / ProFund / SIGAP were rendered from their live prototypes. Each
  // list is ordered by visual impact — `first` is the hero shot.

  static const String _g = 'assets/works/_gallery';

  static const List<String> feTouch = [
    '$_g/fe-teller/01-dashboard.jpg',
    '$_g/fe-teller/02-transaction.jpg',
    '$_g/fe-teller/03-login.jpg',
  ];

  static const List<String> elssa = [
    '$_g/elssa/01-morning.jpg',
    '$_g/elssa/02-parent.jpg',
    '$_g/elssa/03-student.jpg',
    '$_g/elssa/04-teacher.jpg',
    '$_g/elssa/05-homeroom.jpg',
    '$_g/elssa/06-principal.jpg',
  ];

  static const List<String> balai = [
    '$_g/balai/01-home.jpg',
    '$_g/balai/02-seller.jpg',
    '$_g/balai/03-curator.jpg',
    '$_g/balai/04-drops.jpg',
  ];

  static const List<String> fitx = [
    '$_g/fitx/01-home.jpg',
    '$_g/fitx/02-progress.jpg',
    '$_g/fitx/03-booking.jpg',
    '$_g/fitx/04-profile.jpg',
    '$_g/fitx/05-trainer.jpg',
  ];

  static const List<String> modchat = [
    '$_g/modchat/pic1.jpeg',
    '$_g/modchat/pic2.jpeg',
    '$_g/modchat/pic3.jpeg',
    '$_g/modchat/pic4.jpeg',
    '$_g/modchat/pic5.jpeg',
  ];

  /// Assets the intro decodes before the curtain lifts — logo, the B&W
  /// fragments (About is reached early), and each project's hero shot. The
  /// hero foreground fades in on mount; the heavy hero background loads lazily.
  static List<String> get preload => [
    logo,
    ...fragments,
    modchat.first,
    feTouch.first,
    elssa.first,
    fitx.first,
    balai.first,
  ];
}
