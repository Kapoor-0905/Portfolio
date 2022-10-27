import 'package:flutter/material.dart';
import 'package:portfolio/responsive/responsive.dart';
import './aboutDesktop.dart';
import 'package:portfolio/sections/about/aboutMobile.dart';
import 'package:portfolio/sections/about/aboutTablet.dart';

class About extends StatelessWidget {
  const About({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Responsive(
      tablet: AboutTab(),
      mobile: AboutMobile(),
      desktop: AboutDesktop(),
    );
  }
}
