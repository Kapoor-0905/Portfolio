import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';

String integerMonthToString() {
  switch (DateTime.now().month) {
    case 1:
      return "JAN";
    case 2:
      return "FEB";
    case 3:
      return "MAR";
    case 4:
      return "APR";
    case 5:
      return "MAY";
    case 6:
      return "JUN";
    case 7:
      return "JUL";
    case 8:
      return "AUG";
    case 9:
      return "SEPT";
    case 10:
      return "OCT";
    case 11:
      return "NOV";
    case 12:
      return "DEC";
    default:
      return "Unknown";
  }
}

void openLink(String link) async {
  final uri = Uri.parse(link);
  if (await canLaunchUrl(uri)) {
    await launchUrl(
      uri,
      mode: LaunchMode.platformDefault, // Default for web
    );
  } else {
    throw 'Could not launch $link';
  }
}

void openMailto() async {
  final Uri params = Uri(
    scheme: 'mailto',
    path: 'ashutoshkapoor8965@gmail.com',
    query: 'subject=Hello&body=How are you?',
  );

  if (await canLaunchUrl(params)) {
    await launchUrl(params, mode: LaunchMode.externalApplication);
  } else {
    throw 'Could not launch $params';
  }
}

copyToClipboard(String text) {
  Clipboard.setData(ClipboardData(text: text));
}
