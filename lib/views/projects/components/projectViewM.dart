import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kapoor_0905/data/projectDetails.dart';
import 'package:kapoor_0905/extensions/widgetExtensions.dart';
import 'package:kapoor_0905/utils/assets.dart';
import 'package:kapoor_0905/utils/functions.dart';
import 'package:kapoor_0905/utils/styles.dart';
import 'package:kapoor_0905/views/projects/widgets/projectAboutTileM.dart';

class ProjectViewM extends StatefulWidget {
  final Details projectDetails;

  const ProjectViewM({super.key, required this.projectDetails});

  @override
  State<ProjectViewM> createState() => _ProjectViewMState();
}

class _ProjectViewMState extends State<ProjectViewM> {
  final Styles nunito = Styles.nunito();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Image.asset(widget.projectDetails.projectBg),
                Positioned(
                  top: 10,
                  left: 0,
                  child: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      CupertinoIcons.back,
                      size: 25,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.asset(
                        widget.projectDetails.projectIcon,
                        width: 100,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          widget.projectDetails.projectName,
                          style: const TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          widget.projectDetails.category,
                          style: const TextStyle(
                            fontSize: 14,
                            color: Colors.grey,
                          ),
                        ),
                        const SizedBox(height: 15),
                        Row(
                          children: [
                            Visibility(
                              visible: widget.projectDetails.platforms
                                  .contains("iOS"),
                              child: MouseRegion(
                                cursor: SystemMouseCursors.click,
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 3),
                                  decoration: BoxDecoration(
                                      color: Colors.blue,
                                      borderRadius: BorderRadius.circular(30)),
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
                                  widget.projectDetails.links["ios"] == ""
                                      ? null
                                      : openLink(
                                          widget.projectDetails.links["iOS"]);
                                }),
                              ),
                            ),
                            SizedBox(
                                width: widget.projectDetails.platforms
                                            .contains("iOS") &&
                                        widget.projectDetails.platforms
                                            .contains("Android")
                                    ? 10
                                    : 0),
                            Visibility(
                              visible: widget.projectDetails.platforms
                                  .contains("Android"),
                              child: MouseRegion(
                                cursor: SystemMouseCursors.click,
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 3),
                                  decoration: BoxDecoration(
                                      color: Colors.blue,
                                      borderRadius: BorderRadius.circular(30)),
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
                                  widget.projectDetails.links["android"] == ""
                                      ? null
                                      : openLink(widget
                                          .projectDetails.links["android"]);
                                }),
                              ),
                            ),
                            SizedBox(
                                width: widget.projectDetails.platforms
                                            .contains("iOS") &&
                                        widget.projectDetails.platforms
                                            .contains("Android")
                                    ? 10
                                    : 0),
                            Visibility(
                              visible: widget.projectDetails.platforms
                                  .contains("Web"),
                              child: MouseRegion(
                                cursor: SystemMouseCursors.click,
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 3),
                                  decoration: BoxDecoration(
                                      color: Colors.blue,
                                      borderRadius: BorderRadius.circular(30)),
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
                                  widget.projectDetails.links["web"] == ""
                                      ? null
                                      : openLink(
                                          widget.projectDetails.links["web"]);
                                }),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ProjectAboutTileM(
                        title: "COMPANY",
                        value: widget.projectDetails.companyName,
                        icon: SvgPicture.asset(
                          Assets.company,
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                        child: VerticalDivider(),
                      ),
                      ProjectAboutTileM(
                        title: "COUNTRIES",
                        value: "India",
                        icon: Text(
                          "IN",
                          style: nunito.boldText(
                              fontSize: 17, color: Colors.black),
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                        child: VerticalDivider(),
                      ),
                      ProjectAboutTileM(
                        title: "LANGUAGE",
                        value: widget.projectDetails.languages,
                        icon: Text(
                          "EN",
                          style: nunito.boldText(
                              fontSize: 17, color: Colors.black),
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                        child: VerticalDivider(),
                      ),
                      ProjectAboutTileM(
                        title: "CATEGORY",
                        value: widget.projectDetails.category,
                        icon: Image.asset(
                          widget.projectDetails.categoryIcon,
                          width: 23,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                        child: VerticalDivider(),
                      ),
                      ProjectAboutTileM(
                        title: "PLATFORMS",
                        value: widget.projectDetails.platforms,
                        icon: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Visibility(
                              visible: widget.projectDetails.platforms
                                  .contains("Android"),
                              child: SvgPicture.asset(
                                Assets.android,
                                width: 20,
                              ),
                            ),

                            SizedBox(
                                width: widget.projectDetails.platforms
                                            .contains("iOS") &&
                                        widget.projectDetails.platforms
                                            .contains("Android")
                                    ? 8
                                    : 0),
                            Visibility(
                              visible: widget.projectDetails.platforms
                                  .contains("iOS"),
                              child: Image.asset(
                                Assets.applelogo,
                                width: 20,
                              ),
                            ),
                            // const SizedBox(width: 8),
                            Visibility(
                              visible: widget.projectDetails.platforms
                                  .contains("Web"),
                              child: const Icon(CupertinoIcons.globe,
                                  color: Colors.black, size: 20),
                            ),
                          ],
                        ).bottomMargin(3),
                      ),
                    ],
                  ),
                ),
                const Divider().verticalMargin(10),
                Text(
                  "About this project",
                  style: nunito.semiBoldText(fontSize: 18, color: Colors.black),
                ),
                const SizedBox(height: 10),
                Text(
                  widget.projectDetails.projectTimeline,
                  style: nunito.mediumText(
                    fontSize: 12,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  widget.projectDetails.projectDescription,
                  style: nunito.regularText(fontSize: 14, color: Colors.black),
                ),
                Visibility(
                  visible: widget.projectDetails.projectAssets.isNotEmpty,
                  child: const Divider().verticalMargin(10)),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: List.generate(
                        widget.projectDetails.projectAssets.length, (index) {
                      return Image.asset(
                        widget.projectDetails.projectAssets[index],
                        height: 200,
                      ).rightMargin(10);
                    }),
                  ),
                ),
                const Divider().verticalMargin(10),
                Text(
                  "Information",
                  style: nunito.semiBoldText(fontSize: 18, color: Colors.black),
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Role",
                          style: nunito.mediumText(
                              fontSize: 14, color: Colors.grey),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          widget.projectDetails.devRole,
                          style: nunito.regularText(
                              fontSize: 15, color: Colors.black),
                        ),
                      ],
                    ).expanded(),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Client",
                          style: nunito.mediumText(
                              fontSize: 14, color: Colors.grey),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          widget.projectDetails.companyName,
                          style: nunito.regularText(
                              fontSize: 15, color: Colors.black),
                        ),
                      ],
                    ).expanded(),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Team size",
                          style: nunito.mediumText(
                              fontSize: 14, color: Colors.grey),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          widget.projectDetails.teamSize,
                          style: nunito.regularText(
                              fontSize: 15, color: Colors.black),
                        ),
                      ],
                    ).expanded(),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Duration",
                          style: nunito.mediumText(
                              fontSize: 14, color: Colors.grey),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          widget.projectDetails.projectDuration,
                          style: nunito.regularText(
                              fontSize: 15, color: Colors.black),
                        ),
                      ],
                    ).expanded(),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Language",
                          style: nunito.mediumText(
                              fontSize: 14, color: Colors.grey),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          widget.projectDetails.languages,
                          style: nunito.regularText(
                              fontSize: 15, color: Colors.black),
                        ),
                      ],
                    ).expanded(),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Country",
                          style: nunito.mediumText(
                              fontSize: 14, color: Colors.grey),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          widget.projectDetails.countries,
                          style: nunito.regularText(
                              fontSize: 15, color: Colors.black),
                        ),
                      ],
                    ).expanded(),
                  ],
                ),
                const SizedBox(height: 50),
              ],
            ).horizonalMargin(20),
          ],
        ),
      ),
    );
  }
}
