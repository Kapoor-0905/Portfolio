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
  static const String dsc = 'assets/work/sma.png';
  //static const String sastaticket = 'assets/work/st.png';
  static const String university = 'assets/work/upes.png';
  static const String fullterIsb = 'assets/work/open.png';

  // services
  static const String hackathon = 'assets/services/hackathon.png';
  static const String blog = 'assets/services/blog.png';
  static const String appDev = 'assets/services/app.png';
  static const String rapid = 'assets/services/hacktoberfest.png';
  static const String openSource = 'assets/services/open.png';
  static const String openSourceBlack = 'assets/services/open_b.png';

  static const List<String> socialIconURL = [
    "https://img.icons8.com/ios-glyphs/480/ffffff/instagram-new.png",
    "https://img.icons8.com/android/480/ffffff/twitter.png",
    "https://img.icons8.com/metro/308/ffffff/linkedin.png",
    "https://img.icons8.com/material-rounded/384/ffffff/github.png",
    "https://cdn.iconscout.com/icon/free/png-256/leetcode-3521542-2944960.png",
    "https://cdn4.iconfinder.com/data/icons/logos-brands-5/24/codewars-512.png",
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
      'https://drive.google.com/file/d/1RLsJyvlxflnH_U7OuaxiMPkHatUUBv3a/view?usp=sharing';

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
