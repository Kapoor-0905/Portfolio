import 'package:flutter/material.dart';
import 'package:kapoor_0905/data/projectDetails.dart';
import 'package:kapoor_0905/extensions/widgetExtensions.dart';
import 'package:kapoor_0905/utils/styles.dart';
import 'package:kapoor_0905/views/projects/components/projectView.dart';

class ProjectTile extends StatelessWidget {
  final String projectName;
  final String projectType;
  final String projectImage;
  final String projectBg;
  final Details projectDetails;
  const ProjectTile({
    super.key,
    required this.projectName,
    required this.projectType,
    required this.projectImage,
    required this.projectBg,
    required this.projectDetails,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final Styles nunito = Styles.nunito();
    return SizedBox(
      width: width * 0.4,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                backgroundColor: Colors.white,
                radius: 25,
                backgroundImage: AssetImage(projectImage),
              ),
              SizedBox(
                width: width * 0.015,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    projectName,
                    style: nunito.boldText(fontSize: 16),
                  ),
                  Text(
                    projectType,
                    style: nunito.regularText(fontSize: 12),
                  )
                ],
              ),
              const Spacer(),
              MouseRegion(
                cursor: SystemMouseCursors.click,
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(40),
                  ),
                  child: Text(
                    "view",
                    style: nunito.boldText(fontSize: 14, color: Colors.blue),
                  ),
                ).onTap(onTap: () {
                  Navigator.pop(context);
                  showAboutMePopUp(
                      context,
                      ProjectView(
                        project: projectDetails,
                      ));
                }),
              )
            ],
          ),
          SizedBox(
            height: height * 0.02,
          ),
          SizedBox(
            width: width * 0.4,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(
                projectBg,
                fit: BoxFit.cover,
              ),
            ),
          )
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
