import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kapoor_0905/extensions/widgetExtensions.dart';
import 'package:kapoor_0905/utils/assets.dart';
import 'package:kapoor_0905/utils/styles.dart';
import 'package:shimmer/shimmer.dart';

class AboutMeMobile extends StatefulWidget {
  const AboutMeMobile({super.key});

  @override
  State<AboutMeMobile> createState() => _AboutMeMobileState();
}

class _AboutMeMobileState extends State<AboutMeMobile>
    with TickerProviderStateMixin {
  final Styles nunito = Styles.nunito();
  List skills = [
    Assets.flutter,
    Assets.dart,
    Assets.c,
    Assets.java,
    Assets.python,
    Assets.firebase,
    Assets.mongoDB,
    Assets.mySQL,
    Assets.nodejs,
    Assets.figma,
    Assets.gitHub,
    Assets.git,
  ];

  bool showSkills = false;

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: const LinearGradient(
          colors: [
            Color.fromARGB(203, 0, 89, 167),
            Color.fromARGB(193, 249, 230, 222),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: AnimatedSize(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        child: AnimatedSwitcher(
          switchInCurve: Curves.easeInOut,
          duration: const Duration(milliseconds: 300),
          reverseDuration: const Duration(milliseconds: 300),
          transitionBuilder: (Widget child, Animation<double> animation) {
            return FadeTransition(opacity: animation, child: child);
          },
          child: showSkills
              ? Column(
                  key: ValueKey<bool>(showSkills),
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Skills",
                          style: nunito.boldText(fontSize: 16),
                        ),
                        const Icon(
                          CupertinoIcons.xmark,
                          size: 20,
                          color: Colors.white,
                        ).onTap(onTap: () {
                          setState(() {
                            showSkills = false;
                          });
                        }),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Wrap(
                      alignment: WrapAlignment.start,
                      runSpacing: 15,
                      children: List.generate(
                        skills.length,
                        (index) {
                          return MouseRegion(
                            child: Container(
                              margin: const EdgeInsets.only(right: 12),
                              child: Column(
                                children: [
                                  SvgPicture.asset(
                                    skills[index],
                                    width: 32,
                                  ),
                                  const SizedBox(height: 5),
                                  Text(
                                    skills[index]
                                        .split("/")
                                        .last
                                        .split(".")
                                        .first,
                                    style: nunito.mediumText(fontSize: 12),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                )
              : Column(
                  key: ValueKey<bool>(showSkills),
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text.rich(
                          TextSpan(
                            text: "Ashutosh Kapoor",
                            style: nunito.boldText(fontSize: 16),
                            children: [
                              TextSpan(
                                text: " (he/him/his)",
                                style: nunito.boldText(
                                    fontSize: 12, color: Colors.grey[350]!),
                              ),
                            ],
                          ),
                        ),
                        Text(
                          "21 yrs",
                          style: nunito.boldText(fontSize: 15),
                        ),
                      ],
                    ),
                    const SizedBox(height: 5),
                    Text.rich(
                      TextSpan(
                        text: "2 ",
                        style: nunito.regularText(fontSize: 32),
                        children: [
                          TextSpan(
                            text: "yrs of experience",
                            style: nunito.regularText(fontSize: 16),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 5),
                    Shimmer.fromColors(
                      baseColor: Colors.white,
                      highlightColor: Colors.blue,
                      child: Text(
                        "Flutter Developer",
                        style: nunito.boldText(fontSize: 14),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 10),
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.3),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Text(
                        "A final year student pursuing BTech CSE specialized in Open source and Standards at UPES, Dehradun",
                        textAlign: TextAlign.left,
                        style: nunito.mediumText(fontSize: 13),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          "View skills",
                          style: nunito.mediumText(
                              fontSize: 12, color: Colors.black),
                        ).onTap(onTap: () {
                          setState(() {
                            showSkills = true;
                          });
                        }),
                      ],
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}
