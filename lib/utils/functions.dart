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

String getDayFromDate(DateTime date) {
  switch (date.weekday) {
    case 1:
      return "Monday";
    case 2:
      return "Tuesday";
    case 3:
      return "Wednesday";
    case 4:
      return "Thursday";
    case 5:
      return "Friday";
    case 6:
      return "Saturday";
    case 7:
      return "Sunday";
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

void openLinkM(String link) async {
  final uri = Uri.parse(link);
  if (await canLaunchUrl(uri)) {
    await launchUrl(
      uri,
      mode: LaunchMode.externalApplication, // Default for mobile
    );
  } else {
    throw 'Could not launch $link';
  }
}

void openEmailApp(String emailAddress) async {
  final Uri emailUri = Uri(
    scheme: 'mailto',
    path: emailAddress,
    query: '', // You can add subject and body here
  );

  if (await canLaunchUrl(emailUri)) {
    await launchUrl(emailUri);
  } else {
    // Handle the case where the email app is not available
    throw 'Could not launch email app';
  }
}

copyToClipboard(String text) {
  Clipboard.setData(ClipboardData(text: text));
}

void sendEmail() {
  String email = "ashutoshkapoor8965@gmail.com";
}

makingPhoneCall() async {
  var url = Uri.parse("tel:7088206475");
  if (await canLaunchUrl(url)) {
    await launchUrl(url);
  } else {
    throw 'Could not launch $url';
  }
}
