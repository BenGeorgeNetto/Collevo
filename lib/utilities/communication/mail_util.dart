import 'package:url_launcher/url_launcher.dart';

class EmailUtils {
  static void sendEmail({required String emailAddress}) async {
    final url =
        Uri.parse("mailto:$emailAddress?subject=Collevo%20App%20Feedback");
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
