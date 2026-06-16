import 'package:voicein/services/email_service.dart';
import 'package:voicein/services/appLauncher_service.dart';

class Command {
  static void process(String command) {
    command = command.toLowerCase();

    if (command.contains("send email")) {
      final emailRegex = RegExp(
        r'[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}',
      );

      final match = emailRegex.firstMatch(command);

      if (match != null) {
        String email = match.group(0)!;

        String subject = "";
        String body = "";

        if (command.contains("subject")) {
          subject = command
              .split("subject")[1]
              .split("body")[0]
              .trim();
        }

        if (command.contains("body")) {
          body = command.split("body")[1].trim();
        }

        EmailService.composeEmail(
          email,
          subject: subject,
          body: body,
        );
      }

      return;
    }

    if (command.contains("open gmail")) {
      ApplauncherService.openGmail();
    }

    if (command.contains("open whatsapp")) {
      ApplauncherService.openWhatsapp();
    }
  }
}
