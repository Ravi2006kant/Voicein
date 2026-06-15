import 'package:url_launcher/url_launcher.dart';

class EmailService {
  static Future<void> composeEmail(
    String email, {
    String subject = "",
    String body = "",
  }) async {
    final Uri emailUri = Uri(
      scheme: 'mailto',
      path: email,
      queryParameters: {
        'subject': subject,
        'body': body,
      },
    );

    await launchUrl(emailUri);
  }
}