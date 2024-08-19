import 'package:flutter/material.dart';
import 'package:kapoor_0905/data/projectDetails.dart';
import 'package:kapoor_0905/extensions/widgetExtensions.dart';
import 'package:kapoor_0905/utils/assets.dart';
import 'package:kapoor_0905/utils/styles.dart';
import 'package:kapoor_0905/views/projects/components/projectTile.dart';
import 'package:kapoor_0905/views/projects/components/projectView.dart';

class Projects extends StatefulWidget {
  const Projects({super.key});

  @override
  State<Projects> createState() => _ProjectsState();
}

class _ProjectsState extends State<Projects> with TickerProviderStateMixin {
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
                      "Projects",
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
                        ).onTap(onTap: () {}),
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
              SizedBox(height: height * 0.03),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Featured",
                    style: nunito.semiBoldText(fontSize: 22),
                  ),
                  SizedBox(
                    height: height * 0.02,
                    child: const Divider(),
                  ),
                  SizedBox(
                    height: height * 0.02,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Crezam",
                            style: nunito.boldText(fontSize: 26),
                          ),
                          SizedBox(
                            height: height * 0.005,
                          ),
                          Text(
                            "Business Tool",
                            style: nunito.regularText(fontSize: 12),
                          ),
                          SizedBox(
                            height: height * 0.03,
                          ),
                          Text(
                            "A platform for creators to showcase their work and get hired.",
                            style: nunito.regularText(fontSize: 16),
                          ),
                          SizedBox(
                            height: height * 0.03,
                          ),
                          MouseRegion(
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 3),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(40),
                              ),
                              child: Text(
                                "See more",
                                style: nunito.boldText(
                                    fontSize: 14, color: Colors.blue),
                              ),
                            ).onTap(onTap: () {
                              Navigator.pop(context);
                              showAboutMePopUp(
                                  context,
                                  ProjectView(
                                    project: crezam,
                                  ));
                            }),
                          )
                        ],
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.asset(
                          Assets.crezam,
                          width: width * 0.3,
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: height * 0.04,
                  ),
                  Text(
                    "My Projects",
                    style: nunito.semiBoldText(fontSize: 22),
                  ),
                  SizedBox(
                    height: height * 0.03,
                    child: const Divider(),
                  ),
                  SizedBox(
                    height: height * 0.02,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ProjectTile(
                        projectDetails: quickcare,
                        projectName: "QuickCare",
                        projectType: "Health & Management",
                        projectImage: Assets.quickcare,
                        projectBg: Assets.quickcarebg,
                      ),
                      SizedBox(width: width * 0.01),
                      ProjectTile(
                        projectDetails: curiosify,
                        projectName: "Curiosify",
                        projectType: "EduTech",
                        projectImage: Assets.curiosify,
                        projectBg: Assets.curiosifybg,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: height * 0.04,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ProjectTile(
                        projectDetails: jancare,
                        projectName: "AGC JANCARE DR (BT/AGCJC0011/01/22)",
                        projectType: "Health & Research",
                        projectImage: Assets.jancare,
                        projectBg: Assets.jancarebg,
                      ),
                      SizedBox(width: width * 0.01),
                      ProjectTile(
                        projectDetails: kharchapani,
                        projectName: "Kharcha Pani",
                        projectType: "Productivity & Finance",
                        projectImage: Assets.kharchapani,
                        projectBg: Assets.kharchapanibg,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: height * 0.04,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ProjectTile(
                        projectDetails: musclegrm,
                        projectName: "MuscleGrm",
                        projectType: "Health & Fitness",
                        projectImage: Assets.musclegrm,
                        projectBg: Assets.musclegrmbg,
                      ),
                      SizedBox(width: width * 0.01),
                      ProjectTile(
                        projectDetails: careerasta,
                        projectName: "Career Raasta",
                        projectType: "Education",
                        projectImage: Assets.careerasta,
                        projectBg: Assets.careerastabg,
                      )
                    ],
                  ),
                  SizedBox(
                    height: height * 0.1,
                  ),
                ],
              ).horizontalPadding(padding: width * 0.02)
            ],
          ),
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
