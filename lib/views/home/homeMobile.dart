import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kapoor_0905/extensions/widgetExtensions.dart';
import 'package:kapoor_0905/splash.dart';
import 'package:kapoor_0905/utils/assets.dart';
import 'package:kapoor_0905/utils/functions.dart';
import 'package:kapoor_0905/utils/styles.dart';
import 'package:kapoor_0905/views/aboutme/aboutMeMobile.dart';
import 'package:kapoor_0905/views/aboutme/aboutMobileFull.dart';
import 'package:kapoor_0905/views/contact/contactMobile.dart';
import 'package:kapoor_0905/views/projects/projectsMobile.dart';

class HomeMobile extends StatefulWidget {
  const HomeMobile({super.key});

  @override
  State<HomeMobile> createState() => _HomeMobileState();
}

class _HomeMobileState extends State<HomeMobile> with TickerProviderStateMixin {
  late AnimationController emailAnimationController;
  late Animation<double> emailAnimation;
  late AnimationController projectAnimationController;
  late Animation<double> projectAnimation;
  late AnimationController contactAnimationController;
  late Animation<double> contactAnimation;

  late Stream<DateTime> dateTimeStream;
  final Styles nunito = Styles.nunito();
  int currentIndex = 0;
  DateTime currentDate = DateTime.now();

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

  get ashutoshkapoor8965 => null;

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarColor: Color.fromARGB(255, 152, 211, 243)));
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage(Assets.bg1), fit: BoxFit.cover)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: height * 0.05),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: width * 0.45,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        getDayFromDate(currentDate),
                        style: nunito.semiBoldText(
                            fontSize: 14, color: Colors.red),
                      ),
                      Text(
                        currentDate.day.toString(),
                        style: nunito.mediumText(
                            fontSize: 32, color: Colors.black),
                      ),
                      Container(
                        padding:
                            const EdgeInsets.only(left: 7, top: 4, bottom: 4),
                        decoration: const BoxDecoration(
                          color: Colors.black12,
                          border: Border(
                            left: BorderSide(
                              color: Colors.black,
                              width: 2,
                            ),
                          ),
                        ),
                        child: Row(
                          children: [
                            SvgPicture.asset(Assets.gitHub, width: 20),
                            const SizedBox(width: 8),
                            Text(
                              'GitHub',
                              style: nunito.mediumText(
                                  fontSize: 14, color: Colors.black),
                            )
                          ],
                        ),
                      ).onTap(onTap: () {
                        openLink("https://www.github.com/Kapoor-0905");
                      }),
                      const SizedBox(height: 10),
                      Container(
                        padding:
                            const EdgeInsets.only(left: 7, top: 4, bottom: 4),
                        decoration: BoxDecoration(
                          color: const Color(0xFF0077B5).withOpacity(0.1),
                          border: const Border(
                            left: BorderSide(
                              color: Color(0xFF0077B5),
                              width: 2,
                            ),
                          ),
                        ),
                        child: Row(
                          children: [
                            Image.asset(Assets.linkedin, width: 20),
                            const SizedBox(width: 8),
                            Text(
                              'LinkedIn',
                              style: nunito.mediumText(
                                  fontSize: 14, color: Colors.black),
                            )
                          ],
                        ),
                      ).onTap(onTap: () {
                        openLink("https://www.linkedin.com/in/kapoor0905");
                      })
                    ],
                  ),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        Column(
                          children: [
                            MouseRegion(
                              cursor: SystemMouseCursors.click,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(15),
                                child: Image.asset(
                                  Assets.github,
                                  width: 55,
                                ),
                              ),
                            ).onTap(onTap: () {
                              openLink("https://www.github.com/Kapoor-0905");
                            }),
                            const SizedBox(height: 5),
                            Text(
                              "GitHub",
                              style: nunito.mediumText(
                                  fontSize: 14, color: Colors.black),
                            ),
                          ],
                        ),
                        SizedBox(height: height * 0.03),
                        Column(
                          children: [
                            MouseRegion(
                              cursor: SystemMouseCursors.click,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(15),
                                child: Image.asset(
                                  Assets.linkedin,
                                  width: 55,
                                ),
                              ),
                            ).onTap(onTap: () {
                              openLink(
                                  "https://www.linkedin.com/in/kapoor0905");
                            }),
                            const SizedBox(height: 5),
                            Text(
                              "LinkedIn",
                              style: nunito.mediumText(
                                  fontSize: 14, color: Colors.black),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            MouseRegion(
                              cursor: SystemMouseCursors.click,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(15),
                                child: Image.asset(
                                  Assets.ashutosh,
                                  width: 55,
                                ),
                              ),
                            ),
                            const SizedBox(height: 5),
                            Text(
                              "It's Me",
                              style: nunito.mediumText(
                                  fontSize: 14, color: Colors.black),
                            ),
                          ],
                        ).onTap(onTap: () {
                          nextPageFade(
                              context: context,
                              page: const AboutMobileFull(
                                isWhiteStatusBar: false,
                              ));
                        }),
                        SizedBox(height: height * 0.03),
                        Column(
                          children: [
                            MouseRegion(
                              cursor: SystemMouseCursors.click,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(15),
                                child: Image.asset(
                                  Assets.resume,
                                  width: 55,
                                ),
                              ),
                            ).onTap(onTap: () {
                              openLink(
                                  "https://drive.google.com/file/d/1lQGcbipH1az7O5o0GGd-uguY-tJgb3ZX/view?usp=sharing");
                            }),
                            const SizedBox(height: 5),
                            Text(
                              "Resume",
                              style: nunito.mediumText(
                                  fontSize: 14, color: Colors.black),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ).expanded(),
              ],
            ),
            const SizedBox(height: 20),
            const AboutMeMobile()
          ],
        ),
      ),
      bottomSheet: SizedBox(
        height: height * 0.2,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 3),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black.withOpacity(0.1)),
                color: Colors.white.withOpacity(0.2),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const FlutterLogo(
                    size: 18,
                  ),
                  const SizedBox(width: 10),
                  Text(
                    "Made with Flutter",
                    style: nunito.boldText(fontSize: 12, color: Colors.black),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Container(
                  margin: const EdgeInsets.only(bottom: 10),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.white.withOpacity(0.1)),
                    color: Colors.white.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 7),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      MouseRegion(
                        cursor: SystemMouseCursors.click,
                        child: Image.asset(
                          Assets.mail,
                          width: 60,
                        ),
                      ).onTap(onTap: () {
                        openLink(r"mailto:ashutoshkapoor8965@gmail.com");
                      }),

                      MouseRegion(
                        cursor: SystemMouseCursors.click,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset(
                            Assets.projects,
                            width: 60,
                          ),
                        ),
                      ).onTap(onTap: () {
                        nextPageFade(
                            context: context,
                            page: const ProjectsMobile(
                              isWhiteStatusBar: false,
                            ));
                      }),
                      // SizedBox(
                      //   width: width * 0.008,
                      // ),
                      // c
                      //alendar icon
                      // MouseRegion(
                      //   cursor: SystemMouseCursors.click,
                      //   onEnter: (_) => hover(true),
                      //   onExit: (_) => hover(false),
                      //   child: AnimatedBuilder(
                      //     animation: iconAnimation,
                      //     builder: (context, child) {
                      //       return Container(
                      //         width: iconAnimation.value + 5,
                      //         height: iconAnimation.value + 5,
                      //         padding: EdgeInsets.all(
                      //           size.aspectRatio * 2,
                      //         ),
                      //         decoration: BoxDecoration(
                      //             gradient: const LinearGradient(
                      //               colors: [
                      //                 Colors.red,
                      //                 Colors.white,
                      //               ],
                      //               stops: [0.4, 0.4],
                      //               begin: Alignment.topCenter,
                      //               end: Alignment.bottomCenter,
                      //             ),
                      //             borderRadius:
                      //                 BorderRadius.circular(size.aspectRatio * 5)),
                      //         child: Column(
                      //           mainAxisSize: MainAxisSize.min,
                      //           children: [
                      //             Text(
                      //               integerMonthToString(),
                      //               style:
                      //                   nunito.mediumText(fontSize: size.aspectRatio * 5),
                      //             ),
                      //             SizedBox(height: height * 0.001),
                      //             Text(
                      //               currentDate.day.toString(),
                      //               style: nunito.mediumText(
                      //                   fontSize: size.aspectRatio * 10,
                      //                   color: Colors.black),
                      //             ),
                      //           ],
                      //         ),
                      //       );
                      //     },
                      //   ),
                      // ),

                      Tooltip(
                        message: "Contact",
                        child: MouseRegion(
                          cursor: SystemMouseCursors.click,
                          child: Image.asset(
                            Assets.contact,
                            width: 64,
                          ).onTap(onTap: () {
                            Navigator.push(
                              context,
                              PageRouteBuilder(
                                pageBuilder:
                                    (context, animation, secondaryAnimation) {
                                  return const ContactMobile();
                                },
                                transitionsBuilder: (context, animation,
                                    secondaryAnimation, child) {
                                  const begin = 0.0;
                                  const end = 1.0;
                                  const curve = Curves.easeInOut;

                                  var tween =
                                      Tween(begin: begin, end: end).chain(
                                    CurveTween(curve: curve),
                                  );

                                  return FadeTransition(
                                    opacity: animation.drive(tween),
                                    child: child,
                                  );
                                },
                              ),
                            );
                          }),
                        ),
                      ),
                    ],
                  ),
                ).horizonalMargin(10).expanded(),
              ],
            ),
          ],
        ),
      ),
    );
  }

  showAboutMePopUp(BuildContext context, Widget child) async {
    await showDialog(
        context: context,
        builder: (context) {
          return child;
        });
  }
}
