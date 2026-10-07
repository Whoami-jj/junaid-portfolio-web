import 'package:flutter/foundation.dart';
import 'package:url_launcher/url_launcher.dart';

Future<void> openUrl(String url) async {
  final ok = await launchUrl(Uri.parse(url), webOnlyWindowName: '_blank');
  if (!ok) debugPrint('Could not launch $url');
}

Future<void> openCv() => openUrl(
  'https://drive.google.com/file/d/1ULMiutpyRDiToPE86kmb1LG4ywojPGa_/view?usp=drive_link',
);
