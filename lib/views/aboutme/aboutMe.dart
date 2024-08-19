import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kapoor_0905/extensions/widgetExtensions.dart';
import 'package:kapoor_0905/utils/assets.dart';
import 'package:kapoor_0905/utils/styles.dart';

class AboutMe extends StatefulWidget {
  const AboutMe({super.key});

  @override
  State<AboutMe> createState() => _AboutMeState();
}

class _AboutMeState extends State<AboutMe> with TickerProviderStateMixin {
  late AnimationController closeController;
  late Animation<double> closeAnimation;
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

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    closeController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    closeAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: closeController,
        curve: Curves.easeInOut,
      ),
    );
  }

  void onHover(bool isHovered) {
    if (isHovered) {
      closeController.forward();
    } else {
      closeController.reverse();
    }
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    return Material(
      color: Colors.transparent,
      child: Container(
        margin: EdgeInsets.symmetric(
            horizontal: width * 0.3, vertical: height * 0.15),
        decoration: BoxDecoration(
          color: const Color(0xFF282828),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(vertical: height * 0.005),
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.5),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      MouseRegion(
                          cursor: SystemMouseCursors.click,
                          onEnter: (_) => onHover(true),
                          onExit: (_) => onHover(false),
                          child: AnimatedBuilder(
                            animation: closeAnimation,
                            builder: (context, child) {
                              return Container(
                                margin:
                                    const EdgeInsets.only(right: 5, left: 10),
                                width: 12,
                                height: 12,
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.red,
                                ),
                                child: AnimatedOpacity(
                                  duration: const Duration(milliseconds: 300),
                                  opacity: closeAnimation.value,
                                  child: const Icon(
                                    Icons.close,
                                    size: 10,
                                  ),
                                ),
                              ).onTap(onTap: () {
                                Navigator.pop(context);
                              });
                            },
                          )),
                      Container(
                        margin: const EdgeInsets.only(right: 5),
                        width: 12,
                        height: 12,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.grey[400]!,
                        ),
                      ),
                      Container(
                        width: 12,
                        height: 12,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.grey[400],
                        ),
                      ),
                    ],
                  ),
                  Text(
                    "About Me",
                    style: nunito.mediumText(fontSize: 13),
                  ),
                  Row(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(right: 5, left: 10),
                        width: 12,
                        height: 12,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.transparent,
                        ),
                      ).onTap(onTap: () {
                        Navigator.pop(context);
                      }),
                      Container(
                        margin: const EdgeInsets.only(right: 5),
                        width: 12,
                        height: 12,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.transparent,
                        ),
                      ),
                      Container(
                        width: 12,
                        height: 12,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.transparent,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Column(
              children: [
                SizedBox(
                  height: height * 0.02,
                ),
                Image.asset(
                  Assets.me,
                  width: width * 0.2,
                ),
                Text.rich(
                  TextSpan(
                      text: "Ashutosh Kapoor ",
                      style: nunito.boldText(fontSize: 22),
                      children: [
                        TextSpan(
                          text: "(He/Him)",
                          style: nunito.regularText(
                              fontSize: 14, color: Colors.grey),
                        )
                      ]),
                ),
                SizedBox(
                  height: height * 0.01,
                ),
                Text(
                  "Flutter Developer",
                  style: nunito.regularText(fontSize: 16),
                ),
                SizedBox(
                  height: height * 0.01,
                ),
                Container(
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Text(
                    "A final year student pursuing BTech CSE specialized in Open source and Standards at UPES, Dehradun",
                    textAlign: TextAlign.center,
                    style: nunito.mediumText(fontSize: 13),
                  ),
                ),
                SizedBox(
                  height: height * 0.01,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Experience",
                      style: nunito.boldText(fontSize: 16),
                    ),
                    Text(
                      "2 years",
                      style: nunito.regularText(fontSize: 14),
                    ),
                  ],
                ),
                SizedBox(
                  height: height * 0.01,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Location",
                      style: nunito.boldText(fontSize: 16),
                    ),
                    Text(
                      "Dehradun, India",
                      style: nunito.regularText(fontSize: 14),
                    ),
                  ],
                ),
                SizedBox(
                  height: height * 0.01,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Skills",
                      style: nunito.boldText(fontSize: 16),
                    ).expanded(flex: 3),
                    Wrap(
                      alignment: WrapAlignment.end,
                      children: List.generate(skills.length, (index) {
                        return MouseRegion(
                          child: Tooltip(
                            message: skills[index]
                                .toString()
                                .replaceAll("svg/", "")
                                .replaceAll(".svg", ""),
                            child: Container(
                              margin: const EdgeInsets.all(5),
                              child: SvgPicture.asset(
                                skills[index],
                                width: 32,
                                color:
                                    skills[index].toString().contains("GitHub")
                                        ? Colors.white
                                        : null,
                              ),
                            ),
                          ),
                        );
                      }),
                    ).expanded(flex: 5)
                  ],
                ),
              ],
            ).horizontalPadding(padding: width * 0.02)
          ],
        ),
      ),
    );
  }
}
