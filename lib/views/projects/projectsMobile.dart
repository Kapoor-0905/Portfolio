import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kapoor_0905/data/projectDetails.dart';
import 'package:kapoor_0905/extensions/widgetExtensions.dart';
import 'package:kapoor_0905/splash.dart';
import 'package:kapoor_0905/utils/assets.dart';
import 'package:kapoor_0905/utils/styles.dart';
import 'package:kapoor_0905/views/aboutme/aboutMobileFull.dart';
import 'package:kapoor_0905/views/projects/components/projectTileM.dart';
import 'package:kapoor_0905/views/projects/components/projectViewM.dart';

class ProjectsMobile extends StatefulWidget {
  final bool isWhiteStatusBar;
  const ProjectsMobile({super.key, required this.isWhiteStatusBar});

  @override
  State<ProjectsMobile> createState() => _ProjectsMobileState();
}

class _ProjectsMobileState extends State<ProjectsMobile> {
  final Styles nunito = Styles.nunito();

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarColor: Colors.white));
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Icon(
                    CupertinoIcons.back,
                    size: 22,
                  ).onTap(onTap: () {
                    Future.delayed(const Duration(milliseconds: 200), () {
                      SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
                          statusBarColor: widget.isWhiteStatusBar
                              ? Colors.white
                              : const Color.fromARGB(255, 152, 211, 243)));
                    });

                    Navigator.pop(context);
                  }),
                  const SizedBox(width: 10),
                  Text(
                    "Projects",
                    style: nunito.boldText(fontSize: 26, color: Colors.black),
                  ),
                  const Spacer(),
                  const CircleAvatar(
                    radius: 18,
                    backgroundImage: AssetImage(Assets.ashutosh),
                  ).onTap(onTap: () {
                    nextPageFade(
                        context: context,
                        page: const AboutMobileFull(
                          isWhiteStatusBar: true,
                        ));
                  })
                ],
              ),
              const SizedBox(height: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Featured",
                    style:
                        nunito.semiBoldText(fontSize: 14, color: Colors.blue),
                  ),
                  const SizedBox(height: 3),
                  Text(
                    "Crezam",
                    style: nunito.boldText(fontSize: 18, color: Colors.black),
                  ),
                  Text(
                    "A platform for creators to showcase their work and get hired.",
                    style:
                        nunito.regularText(fontSize: 14, color: Colors.black),
                  ),
                  const SizedBox(height: 5),
                  Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(Assets.crezam),
                      ),
                      Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.asset(
                              Assets.crezamlogo,
                              width: 50,
                            ),
                          ),
                          const SizedBox(width: 10),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Crezam",
                                style: nunito.semiBoldText(fontSize: 16),
                              ),
                              Text(
                                "A platform for creators to showcase their work and get hired.",
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: nunito.regularText(fontSize: 14),
                              ),
                            ],
                          ).expanded(),
                          const SizedBox(width: 5),
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 6),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(40),
                            ),
                            child: Text(
                              "See more",
                              style: nunito.boldText(
                                  fontSize: 12, color: Colors.blue),
                            ),
                          ).onTap(onTap: () {
                            nextPageFade(
                                context: context,
                                page: ProjectViewM(projectDetails: crezam));
                          })
                        ],
                      ).horizonalMargin(10).bottomMargin(5)
                    ],
                  )
                ],
              ),
              const SizedBox(height: 20),
              Text(
                "All Projects",
                style: nunito.boldText(fontSize: 20, color: Colors.black),
              ),
              const SizedBox(height: 10),
              ProjectTileM(projectDetails: quickcare),
              ProjectTileM(projectDetails: curiosify),
              ProjectTileM(projectDetails: jancare),
              ProjectTileM(projectDetails: kharchapani),
              ProjectTileM(projectDetails: musclegrm),
              ProjectTileM(projectDetails: careerasta),
            ],
          ),
        ),
      ),
    );
  }
}
