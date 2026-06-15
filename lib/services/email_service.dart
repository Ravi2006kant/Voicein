import 'package:url_launcher/url_launcher.dart';

class EmailService {
  static Future<void> composeEmail(String email) async {
    final Uri emailuri = Uri(
      scheme: 'mailto',
      path: email,
      queryParameters: {'subject': 'hello', 'body': ''},
    );
    await launchUrl(emailuri);
  }
}
