import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kapoor_0905/extensions/widgetExtensions.dart';
import 'package:kapoor_0905/splash.dart';
import 'package:kapoor_0905/utils/assets.dart';
import 'package:kapoor_0905/utils/styles.dart';
import 'package:kapoor_0905/views/projects/projectsMobile.dart';

class AboutMobileFull extends StatefulWidget {
  final bool isWhiteStatusBar;
  const AboutMobileFull({super.key, required this.isWhiteStatusBar});

  @override
  State<AboutMobileFull> createState() => _AboutMobileFullState();
}

class _AboutMobileFullState extends State<AboutMobileFull> {
  final Styles nunito = Styles.nunito();

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Color.fromARGB(255, 245, 245, 245),
    ));
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 245, 245, 245),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Column(
          children: [
            const SizedBox(height: 10),
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    Future.delayed(const Duration(milliseconds: 200), () {
                      SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
                          statusBarColor: widget.isWhiteStatusBar
                              ? Colors.white
                              : const Color.fromARGB(255, 152, 211, 243)));
                    });
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    CupertinoIcons.back,
                    size: 25,
                    color: Colors.blue,
                  ),
                ),
              ],
            ),
            const CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage(Assets.ashutosh),
            ),
            const SizedBox(height: 10),
            Text(
              'Ashutosh Kapoor',
              style: nunito.semiBoldText(fontSize: 18, color: Colors.black),
            ),
            const SizedBox(height: 5),
            Text(
              'ashutoshkapoor.official@outlook.com',
              style: nunito.regularText(fontSize: 14, color: Colors.blue),
            ),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              color: Colors.white,
              child: Column(
                children: [
                  Row(
                    children: [
                      const Icon(
                        CupertinoIcons.location_fill,
                        size: 22,
                        color: Colors.blue,
                      ),
                      const SizedBox(width: 10),
                      Text(
                        "Dehradun, Uttarakhand, India",
                        style: nunito.mediumText(
                            fontSize: 14, color: Colors.black),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                    child: Divider(
                      thickness: 0.5,
                    ),
                  ),
                  Row(
                    children: [
                      const Icon(
                        CupertinoIcons.phone_fill,
                        size: 22,
                        color: Colors.blue,
                      ),
                      const SizedBox(width: 10),
                      Text(
                        "+91 7088-206-475",
                        style: nunito.mediumText(
                            fontSize: 14, color: Colors.black),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                    child: Divider(
                      thickness: 0.5,
                    ),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Icon(
                        CupertinoIcons.building_2_fill,
                        size: 22,
                        color: Colors.blue,
                      ),
                      const SizedBox(width: 10),
                      Text(
                        "Final year student at UPES, Dehradun, pursuing B.Tech CSE with specialization Open source and standards.",
                        maxLines: 3,
                        style: nunito.mediumText(
                            fontSize: 14, color: Colors.black),
                      ).expanded()
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Proficient In:",
                  style: nunito.semiBoldText(fontSize: 16, color: Colors.black),
                ),
              ],
            ).leftMargin(20),
            const SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              color: Colors.white,
              child: Row(
                children: [
                  Text(
                    "Flutter, Dart, C, Python, Java, Firebase, MongoDB, MySQL, HTML, CSS, Git, GitHub, Node.JS, Figma",
                    style: nunito.mediumText(fontSize: 14, color: Colors.black),
                  ).expanded()
                ],
              ),
            ),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              color: Colors.white,
              child: Row(
                children: [
                  Text(
                    "View my projects",
                    style: nunito.mediumText(fontSize: 14, color: Colors.black),
                  )
                ],
              ),
            ).onTap(onTap: () {
              nextPageFade(
                  context: context,
                  page: const ProjectsMobile(isWhiteStatusBar: true));
            }),
          ],
        ),
      ),
    );
  }
}
