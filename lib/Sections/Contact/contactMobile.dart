import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/configs/appDimensions.dart';
import 'package:portfolio/utils/contactUtils.dart';
import 'package:portfolio/Widget/customtextHead.dart';
import 'package:portfolio/Widget/projectCard.dart';

class ContactMobileTab extends StatelessWidget {
  const ContactMobileTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CustomSectionHeading(
          text: "\nGet in Touch",
        ),
        const CustomSectionSubHeading(
          text: "Let's build something together :)\n\n",
        ),
        CarouselSlider.builder(
          itemCount: ContactUtils.titles.length,
          itemBuilder: (BuildContext context, int itemIndex, int i) => Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: ProjectCard(
              projectIconData: ContactUtils.contactIcon[i],
              projectTitle: ContactUtils.titles[i],
              projectDescription: ContactUtils.details[i],
            ),
          ),
          options: CarouselOptions(
            height: AppDimensions.normalize(100),
            autoPlay: true,
            autoPlayInterval: const Duration(seconds: 5),
            enlargeCenterPage: true,
            autoPlayCurve: Curves.fastOutSlowIn,
            autoPlayAnimationDuration: const Duration(milliseconds: 800),
            enableInfiniteScroll: false,
          ),
        ),
      ],
    );
  }
}
