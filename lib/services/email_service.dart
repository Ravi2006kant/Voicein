import 'package:url_launcher/url_launcher.dart';

class EmailService {
  static Future<void> composeEmail(
    String email, {
    String subject = "",
    String body = "",
  }) async {
    final Uri emailUri = Uri.parse(
      'mailto:$email'
      '?subject=${Uri.encodeComponent(subject)}'
      '&body=${Uri.encodeComponent(body)}',
    );

    await launchUrl(emailUri);
  }
}
