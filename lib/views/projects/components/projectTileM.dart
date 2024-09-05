import 'package:flutter/material.dart';
import 'package:kapoor_0905/data/projectDetails.dart';
import 'package:kapoor_0905/extensions/widgetExtensions.dart';
import 'package:kapoor_0905/splash.dart';
import 'package:kapoor_0905/utils/styles.dart';
import 'package:kapoor_0905/views/projects/components/projectViewM.dart';

class ProjectTileM extends StatelessWidget {
  final Details projectDetails;
  const ProjectTileM({
    super.key,
    required this.projectDetails,
  });

  @override
  Widget build(BuildContext context) {
    final Styles nunito = Styles.nunito();
    return InkWell(
      onTap: () {
        nextPageFade(
          context: context,
          page: ProjectViewM(projectDetails: projectDetails),
        );
      },
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.asset(
              projectDetails.projectIcon,
              width: 50,
            ),
          ),
          const SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(projectDetails.projectName,
                  style: nunito.boldText(fontSize: 16, color: Colors.black)),
              const SizedBox(height: 5),
              Text(projectDetails.category,
                  style: nunito.regularText(fontSize: 12, color: Colors.grey)),
            ],
          ),
          const Spacer(),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(40),
            ),
            child: Text(
              "view",
              style: nunito.boldText(fontSize: 14, color: Colors.white),
            ),
          ).onTap(onTap: () {
            nextPageFade(
                context: context,
                page: ProjectViewM(projectDetails: projectDetails));
          }),
        ],
      ),
    ).bottomMargin(10);
  }
}
