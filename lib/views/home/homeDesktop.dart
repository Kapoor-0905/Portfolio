import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:kapoor_0905/extensions/widgetExtensions.dart';
import 'package:kapoor_0905/utils/assets.dart';
import 'package:kapoor_0905/utils/functions.dart';
import 'package:kapoor_0905/utils/styles.dart';
import 'package:kapoor_0905/views/aboutme/aboutMe.dart';
import 'package:kapoor_0905/views/contact/contact.dart';
import 'package:kapoor_0905/views/projects/projects.dart';

class HomeDesktop extends ConsumerStatefulWidget {
  const HomeDesktop({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeDesktopState();
}

class _HomeDesktopState extends ConsumerState<HomeDesktop>
    with TickerProviderStateMixin {
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

  @override
  void initState() {
    super.initState();
    dateTimeStream = Stream<DateTime>.periodic(
        const Duration(seconds: 1), (x) => DateTime.now()).asBroadcastStream();
    emailAnimationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 300));
    emailAnimation =
        Tween<double>(begin: 45, end: 55).animate(emailAnimationController);
    projectAnimationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 300));
    projectAnimation =
        Tween<double>(begin: 45, end: 55).animate(projectAnimationController);
    contactAnimationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 300));
    contactAnimation =
        Tween<double>(begin: 45, end: 55).animate(contactAnimationController);
  }

  void emailhover(bool isHovered) {
    isHovered
        ? emailAnimationController.forward()
        : emailAnimationController.reverse();
  }

  void projecthover(bool isHovered) {
    isHovered
        ? projectAnimationController.forward()
        : projectAnimationController.reverse();
  }

  void contactHover(bool isHovered) {
    isHovered
        ? contactAnimationController.forward()
        : contactAnimationController.reverse();
  }

  @override
  void dispose() {
    emailAnimationController.dispose();
    projectAnimationController.dispose();
    contactAnimationController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    final Size size = MediaQuery.of(context).size;
    // print(size.height);

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage(Assets.bg), fit: BoxFit.cover)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.symmetric(
                  horizontal: width * 0.01, vertical: height * 0.007),
              decoration: const BoxDecoration(color: Colors.black),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      SvgPicture.asset(
                        Assets.appleIcon,
                        width: 16,
                      ),
                      SizedBox(width: width * 0.01),
                      Text(
                        "Ashutosh Kapoor",
                        style: nunito.boldText(fontSize: 14),
                      ),
                      SizedBox(width: width * 0.015),
                      MouseRegion(
                        cursor: SystemMouseCursors.click,
                        child: Text(
                          "About Me",
                          style: nunito.regularText(fontSize: 13),
                        ),
                      ).onTap(onTap: () {
                        showAboutMePopUp(context, const AboutMe());
                      }),
                      SizedBox(width: width * 0.01),
                      MouseRegion(
                        cursor: SystemMouseCursors.click,
                        child: Text(
                          "Projects",
                          style: nunito.regularText(fontSize: 13),
                        ),
                      ).onTap(onTap: () {
                        showAboutMePopUp(context, const Projects());
                      }),
                      SizedBox(width: width * 0.01),
                      MouseRegion(
                        cursor: SystemMouseCursors.click,
                        child: Text(
                          "Contact",
                          style: nunito.regularText(fontSize: 13),
                        ),
                      ).onTap(onTap: () {
                        showAboutMePopUp(context, const Contact());
                      }),
                    ],
                  ),
                  StreamBuilder<DateTime>(
                    stream: dateTimeStream,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        currentDate = snapshot.data!;
                        return Row(
                          children: [
                            Text(
                              DateFormat.yMMMMd().format(currentDate),
                              style: nunito.mediumText(fontSize: 13),
                            ),
                            SizedBox(width: width * 0.005),
                            Text(
                              DateFormat.jm().format(currentDate),
                              style: nunito.mediumText(fontSize: 13),
                            )
                          ],
                        );
                      } else {
                        return const SizedBox();
                      }
                    },
                  ),
                ],
              ),
            ).bottomMargin(size.height * 0.03),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  children: [
                    MouseRegion(
                      cursor: SystemMouseCursors.click,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Image.asset(
                          Assets.github,
                          width: 60,
                        ),
                      ),
                    ).onTap(onTap: () {
                      openLink("https://www.github.com/Kapoor-0905");
                    }),
                    SizedBox(height: height * 0.03),
                    MouseRegion(
                      cursor: SystemMouseCursors.click,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Image.asset(
                          Assets.linkedin,
                          width: 60,
                        ),
                      ),
                    ).onTap(onTap: () {
                      openLink("https://www.linkedin.com/in/kapoor0905");
                    }),
                    SizedBox(height: height * 0.03),
                    MouseRegion(
                      cursor: SystemMouseCursors.click,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Image.asset(
                          Assets.resume,
                          width: 60,
                        ),
                      ),
                    ).onTap(onTap: () {
                      openLink(
                          "https://drive.google.com/file/d/1lQGcbipH1az7O5o0GGd-uguY-tJgb3ZX/view?usp=sharing");
                    }),
                  ],
                ),
                Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Image.asset(
                        Assets.ashutosh,
                        width: width * 0.1,
                      ),
                    ).onTap(onTap: () {
                      showAboutMePopUp(context, const AboutMe());
                    })
                  ],
                )
              ],
            ).horizontalPadding(padding: size.width * 0.015)
          ],
        ),
      ),
      bottomSheet: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            padding: EdgeInsets.symmetric(
                horizontal: size.aspectRatio * 10,
                vertical: size.aspectRatio * 2),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black.withOpacity(0.1)),
              color: Colors.white.withOpacity(0.2),
              borderRadius: BorderRadius.circular(size.aspectRatio * 10),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const FlutterLogo(
                  size: 14,
                ),
                SizedBox(width: width * 0.003),
                Text(
                  "Made with Flutter",
                  style: nunito.boldText(
                      fontSize: size.aspectRatio * 6, color: Colors.black),
                ),
              ],
            ),
          ),
          SizedBox(height: height * 0.01),
          Container(
            margin: EdgeInsets.only(bottom: height * 0.02),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black.withOpacity(0.1)),
              color: Colors.black.withOpacity(0.2),
              borderRadius: BorderRadius.circular(size.aspectRatio * 10),
            ),
            padding: EdgeInsets.symmetric(
                horizontal: size.aspectRatio * 10,
                vertical: size.aspectRatio * 5),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                MouseRegion(
                    cursor: SystemMouseCursors.click,
                    onEnter: (_) => emailhover(true),
                    onExit: (_) => emailhover(false),
                    child: AnimatedBuilder(
                      animation: emailAnimation,
                      builder: (context, child) {
                        return Image.asset(
                          Assets.mail,
                          width: emailAnimation.value,
                          height: emailAnimation.value,
                        );
                      },
                    )),
                SizedBox(
                  width: width * 0.008,
                ),
                MouseRegion(
                  cursor: SystemMouseCursors.click,
                  onEnter: (_) => projecthover(true),
                  onExit: (_) => projecthover(false),
                  child: AnimatedBuilder(
                    animation: projectAnimation,
                    builder: (context, child) {
                      return ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(
                          Assets.projects,
                          width: projectAnimation.value,
                          height: projectAnimation.value,
                        ),
                      );
                    },
                  ),
                ).onTap(onTap: () {
                  showAboutMePopUp(context, const Projects());
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
                SizedBox(
                  width: width * 0.008,
                ),
                Tooltip(
                  message: "Contact",
                  child: MouseRegion(
                    cursor: SystemMouseCursors.click,
                    onEnter: (_) => contactHover(true),
                    onExit: (_) => contactHover(false),
                    child: AnimatedBuilder(
                      animation: contactAnimation,
                      builder: (context, child) {
                        return Image.asset(
                          Assets.contact,
                          width: contactAnimation.value,
                        );
                      },
                    ).onTap(onTap: () {
                      showAboutMePopUp(context, const Contact());
                    }),
                  ),
                ),
              ],
            ),
          ),
        ],
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
