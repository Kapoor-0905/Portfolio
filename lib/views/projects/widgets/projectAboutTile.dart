import 'package:flutter/material.dart';
import 'package:kapoor_0905/utils/styles.dart';

class ProjectAboutTile extends StatelessWidget {
  final String title;
  final String value;
  final Widget icon;
  const ProjectAboutTile({
    super.key,
    required this.title,
    required this.value,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final Styles nunito = Styles.nunito();
    return Column(
      children: [
        Text(
          title,
          style: nunito.extraBoldText(
              fontSize: 14, color: Colors.grey[400]!, letterSpacing: 1.2),
        ),
        SizedBox(height: height * 0.01),
        icon,
        // SvgPicture.asset(
        //   Assets.company,
        //   color: Colors.white,
        // ),
        SizedBox(height: height * 0.01),
        Text(
          value,
          style: nunito.mediumText(fontSize: 14, color: Colors.grey[400]!),
        ),
      ],
    );
  }
}
