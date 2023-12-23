import 'package:flutter/material.dart';
import 'package:portfolio/Sections/about/about.dart';
import 'package:portfolio/Sections/Contact/contact.dart';
import 'package:portfolio/Sections/Home/home.dart';
import 'package:portfolio/Sections/portfolio/portfolio.dart';
import 'package:portfolio/Sections/services/services.dart';
import '../Widget/footer.dart';

class StaticUtils {
  static const String hi = 'assets/hi.gif';

  // photos
  static const String mobilePhoto = 'assets/photos/mobile.png';
  static const String coloredPhoto = 'assets/photos/colored.png';
  static const String blackWhitePhoto = 'assets/photos/black-white.png';

  // work
  static const String school = 'assets/work/kvs.png';
  static const String university = 'assets/work/upes.png';
  static const String open = 'assets/work/open.png';

  // services
  static const String opencommunity = 'assets/services/openLogo.png';
  static const String internship = 'assets/services/internship.png';
  static const String hackathon = 'assets/services/hackathon.png';
  static const String contribute = 'assets/services/opensource.png';
  static const String openSource = 'assets/services/open.png';
  static const String openSourceBlack = 'assets/services/open_b.png';

  static const List<String> socialIconURL = [
    "https://img.icons8.com/ios-glyphs/480/ffffff/instagram-new.png",
    "https://img.icons8.com/android/480/ffffff/twitter.png",
    "https://img.icons8.com/metro/308/ffffff/linkedin.png",
    "https://img.icons8.com/material-rounded/384/ffffff/github.png",
    // "https://icons8.com/icon/PlozTIZdV8xJ/codewars",
    "https://img.icons8.com/external-tal-revivo-color-tal-revivo/24/external-level-up-your-coding-skills-and-quickly-land-a-job-logo-color-tal-revivo.png",
    "https://img.icons8.com/material-outlined/96/codewars.png"
  ];

  static const List<String> socialLinks = [
    "https://instagram.com/kapoor0905",
    "https://twitter.com/kapoor_0905",
    "https://linkedin.com/in/kapoor0905",
    "https://github.com/Kapoor-0905",
    "https://leetcode.com/Kapoor-0905/",
    "https://www.codewars.com/users/Kapoor-0905",
  ];

  static const String resume =
      'https://docs.google.com/document/d/1JHtADs4ymVygIzFSfv8Wo-4pemuv7CZI1FRUCgsbtDE/edit?usp=sharing';

  static const String gitHub = 'https://github.com/Kapoor-0905';
}

class BodyUtils {
  static const List<Widget> views = [
    HomePage(),
    About(),
    Services(),
    Portfolio(),
    Contact(),
    Footer(),
  ];
}
