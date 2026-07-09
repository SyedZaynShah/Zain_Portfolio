import 'dart:async';

import 'package:url_launcher/url_launcher.dart';

/// Non-web fallback — opens the file URL (the `download` attribute is web-only).
///
/// [url] is a site-relative path (e.g. `Raihan_Fadli_CV.pdf`), so it is
/// resolved against the deployed origin before launching — a schemeless
/// relative URI cannot be opened by url_launcher on native targets.
void downloadFile(String url, {String filename = ''}) {
  final resolved = Uri.parse('https://www.raihandev.space/').resolve(url);
  unawaited(launchUrl(resolved));
}
