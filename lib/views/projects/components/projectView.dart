import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kapoor_0905/data/projectDetails.dart';
import 'package:kapoor_0905/extensions/widgetExtensions.dart';
import 'package:kapoor_0905/utils/assets.dart';
import 'package:kapoor_0905/utils/functions.dart';
import 'package:kapoor_0905/utils/styles.dart';
import 'package:kapoor_0905/views/projects/projects.dart';
import 'package:kapoor_0905/views/projects/widgets/projectAboutTile.dart';

class ProjectView extends StatefulWidget {
  final Details project;
  const ProjectView({super.key, required this.project});

  @override
  State<ProjectView> createState() => _ProjectViewState();
}

class _ProjectViewState extends State<ProjectView>
    with TickerProviderStateMixin {
  late AnimationController closeController;
  late Animation<double> closeAnimation;
  final Styles nunito = Styles.nunito();

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
  void dispose() {
    closeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    return Material(
      color: Colors.transparent,
      child: Container(
        margin: EdgeInsets.symmetric(
            horizontal: width * 0.05, vertical: height * 0.04),
        decoration: BoxDecoration(
          color: const Color(0xFF282828),
          borderRadius: BorderRadius.circular(10),
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
                  mainAxisAlignment: MainAxisAlignment.start,
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
                                ).onTap(onTap: () async {
                                  Navigator.pop(context);
                                  await showDialog(
                                      context: context,
                                      builder: (context) {
                                        return const Projects();
                                      });
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
                  ],
                ),
              ),
              SizedBox(height: height * 0.02),
              IconButton(
                onPressed: () async {
                  Navigator.pop(context);
                  await showDialog(
                      context: context,
                      builder: (context) {
                        return const Projects();
                      });
                },
                icon: const Icon(
                  CupertinoIcons.back,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: height * 0.02),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.asset(
                          // Assets.curiosify,
                          widget.project.projectIcon,
                          width: width * 0.07,
                        ),
                      ),
                      SizedBox(width: width * 0.015),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            // "Curiosify",
                            widget.project.projectName,
                            style: nunito.boldText(fontSize: 22),
                          ),
                          Text(
                            // "EduTech",
                            widget.project.category,
                            style: nunito.regularText(fontSize: 14),
                          ),
                          SizedBox(
                            height: height * 0.02,
                          ),
                          Row(
                            children: [
                              Visibility(
                                visible:
                                    widget.project.platforms.contains("iOS"),
                                child: MouseRegion(
                                  cursor: SystemMouseCursors.click,
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10, vertical: 3),
                                    decoration: BoxDecoration(
                                        color: Colors.blue,
                                        borderRadius:
                                            BorderRadius.circular(30)),
                                    child: Row(
                                      children: [
                                        SvgPicture.asset(
                                          Assets.appleIcon,
                                          width: 15,
                                        ),
                                        const SizedBox(width: 5),
                                        Text(
                                          "iOS",
                                          style:
                                              nunito.semiBoldText(fontSize: 14),
                                        )
                                      ],
                                    ),
                                  ).onTap(onTap: () {
                                    widget.project.links["ios"] == ""
                                        ? null
                                        : openLink(widget.project.links["iOS"]);
                                  }),
                                ),
                              ),
                              SizedBox(
                                  width: widget.project.platforms
                                              .contains("iOS") &&
                                          widget.project.platforms
                                              .contains("Android")
                                      ? 10
                                      : 0),
                              Visibility(
                                visible: widget.project.platforms
                                    .contains("Android"),
                                child: MouseRegion(
                                  cursor: SystemMouseCursors.click,
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10, vertical: 3),
                                    decoration: BoxDecoration(
                                        color: Colors.blue,
                                        borderRadius:
                                            BorderRadius.circular(30)),
                                    child: Row(
                                      children: [
                                        SvgPicture.asset(
                                          Assets.android,
                                          width: 15,
                                          color: Colors.white,
                                        ),
                                        const SizedBox(width: 5),
                                        Text(
                                          "Android",
                                          style:
                                              nunito.semiBoldText(fontSize: 14),
                                        )
                                      ],
                                    ),
                                  ).onTap(onTap: () {
                                    widget.project.links["android"] == ""
                                        ? null
                                        : openLink(
                                            widget.project.links["android"]);
                                  }),
                                ),
                              ),
                              SizedBox(
                                  width: widget.project.platforms
                                              .contains("iOS") &&
                                          widget.project.platforms
                                              .contains("Android")
                                      ? 10
                                      : 0),
                              Visibility(
                                visible:
                                    widget.project.platforms.contains("Web"),
                                child: MouseRegion(
                                  cursor: SystemMouseCursors.click,
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10, vertical: 3),
                                    decoration: BoxDecoration(
                                        color: Colors.blue,
                                        borderRadius:
                                            BorderRadius.circular(30)),
                                    child: Row(
                                      children: [
                                        const Icon(CupertinoIcons.globe,
                                            color: Colors.white, size: 20),
                                        const SizedBox(width: 5),
                                        Text(
                                          "Web",
                                          style:
                                              nunito.semiBoldText(fontSize: 14),
                                        )
                                      ],
                                    ),
                                  ).onTap(onTap: () {
                                    widget.project.links["web"] == ""
                                        ? null
                                        : openLink(widget.project.links["web"]);
                                  }),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: height * 0.02),
                  const Divider(),
                  SizedBox(height: height * 0.02),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ProjectAboutTile(
                        title: "COMPANY",
                        value: widget.project.companyName,
                        icon: SvgPicture.asset(
                          Assets.company,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(
                        height: height * 0.07,
                        child: const VerticalDivider(),
                      ),
                      ProjectAboutTile(
                        title: "COUNTRIES",
                        value: "India",
                        icon: Text(
                          "IN",
                          style: nunito.extraBoldText(
                              fontSize: 17, color: Colors.white),
                        ),
                      ),
                      SizedBox(
                        height: height * 0.07,
                        child: const VerticalDivider(),
                      ),
                      ProjectAboutTile(
                        title: "LANGUAGE",
                        value: widget.project.languages,
                        icon: Text(
                          "EN",
                          style: nunito.extraBoldText(
                              fontSize: 17, color: Colors.white),
                        ),
                      ),
                      SizedBox(
                        height: height * 0.07,
                        child: const VerticalDivider(),
                      ),
                      ProjectAboutTile(
                        title: "CATEGORY",
                        value: widget.project.category,
                        icon: Image.asset(
                          widget.project.categoryIcon,
                          width: 23,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(
                        height: height * 0.07,
                        child: const VerticalDivider(),
                      ),
                      ProjectAboutTile(
                        title: "PLATFORMS",
                        value: widget.project.platforms,
                        icon: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Visibility(
                              visible:
                                  widget.project.platforms.contains("Android"),
                              child: SvgPicture.asset(
                                Assets.android,
                                width: 20,
                                color: Colors.white,
                              ),
                            ),

                            SizedBox(
                                width:
                                    widget.project.platforms.contains("iOS") &&
                                            widget.project.platforms
                                                .contains("Android")
                                        ? 8
                                        : 0),
                            Visibility(
                              visible: widget.project.platforms.contains("iOS"),
                              child: SvgPicture.asset(
                                Assets.appleIcon,
                                width: 20,
                              ),
                            ),
                            // const SizedBox(width: 8),
                            Visibility(
                              visible: widget.project.platforms.contains("Web"),
                              child: const Icon(CupertinoIcons.globe,
                                  color: Colors.white, size: 20),
                            ),
                          ],
                        ).bottomMargin(3),
                      ),
                    ],
                  ),
                  SizedBox(height: height * 0.02),
                  const Divider(),
                  SizedBox(height: height * 0.02),
                  Text(
                    "About this project",
                    style: nunito.semiBoldText(fontSize: 22),
                  ),
                  SizedBox(height: height * 0.01),
                  Text(
                    widget.project.projectTimeline,
                    style: nunito.mediumText(
                      fontSize: 12,
                      color: Colors.grey[400]!,
                    ),
                  ),
                  SizedBox(height: height * 0.03),
                  Text(
                    widget.project.projectDescription,
                    style: nunito.regularText(fontSize: 14),
                  ),
                  SizedBox(height: height * 0.03),
                  const Divider(),
                  SizedBox(height: height * 0.03),
                  Text(
                    "Information",
                    style: nunito.semiBoldText(fontSize: 22),
                  ),
                  SizedBox(height: height * 0.02),
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Role",
                            style: nunito.mediumText(
                                fontSize: 14, color: Colors.grey[400]!),
                          ),
                          SizedBox(height: height * 0.004),
                          Text(
                            widget.project.devRole,
                            style: nunito.regularText(fontSize: 15),
                          ),
                        ],
                      ).expanded(),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Client",
                            style: nunito.mediumText(
                                fontSize: 14, color: Colors.grey[400]!),
                          ),
                          SizedBox(height: height * 0.004),
                          Text(
                            widget.project.companyName,
                            style: nunito.regularText(fontSize: 15),
                          ),
                        ],
                      ).expanded(),
                    ],
                  ),
                  SizedBox(height: height * 0.03),
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Team size",
                            style: nunito.mediumText(
                                fontSize: 14, color: Colors.grey[400]!),
                          ),
                          SizedBox(height: height * 0.004),
                          Text(
                            widget.project.teamSize,
                            style: nunito.regularText(fontSize: 15),
                          ),
                        ],
                      ).expanded(),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Duration",
                            style: nunito.mediumText(
                                fontSize: 14, color: Colors.grey[400]!),
                          ),
                          SizedBox(height: height * 0.004),
                          Text(
                            widget.project.projectDuration,
                            style: nunito.regularText(fontSize: 15),
                          ),
                        ],
                      ).expanded(),
                    ],
                  ),
                  SizedBox(height: height * 0.03),
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Language",
                            style: nunito.mediumText(
                                fontSize: 14, color: Colors.grey[400]!),
                          ),
                          SizedBox(height: height * 0.004),
                          Text(
                            widget.project.languages,
                            style: nunito.regularText(fontSize: 15),
                          ),
                        ],
                      ).expanded(),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Country",
                            style: nunito.mediumText(
                                fontSize: 14, color: Colors.grey[400]!),
                          ),
                          SizedBox(height: height * 0.004),
                          Text(
                            widget.project.countries,
                            style: nunito.regularText(fontSize: 15),
                          ),
                        ],
                      ).expanded(),
                    ],
                  ),
                  SizedBox(height: height * 0.1),
                ],
              ).horizontalPadding(padding: width * 0.02),
            ],
          ),
        ),
      ),
    );
  }
}
