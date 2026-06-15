import 'package:voicein/services/appLauncher_service.dart';
import 'package:voicein/services/email_service.dart';

class Command {
  static void process(String command) {
    command = command.toLowerCase();

    // Send email to xyz@gmail.com
    if (command.contains("send email")) {
      final emailRegex = RegExp(
        r'[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}',
      );

      final match = emailRegex.firstMatch(command);

      if (match != null) {
        String email = match.group(0)!;

        EmailService.composeEmail(
          email,
          subject: "Hello",
          body: "",
        );
      }

      return;
    }

    if (command.contains("open gmail")) {
      ApplauncherService.openGmail();
      return;
    }

    if (command.contains("open whatsapp")) {
      ApplauncherService.openWhatsapp();
      return;
    }
  }
}