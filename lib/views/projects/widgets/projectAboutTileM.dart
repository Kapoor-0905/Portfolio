import 'package:flutter/material.dart';
import 'package:kapoor_0905/utils/styles.dart';

class ProjectAboutTileM extends StatelessWidget {
  final String title;
  final String value;
  final Widget icon;
  const ProjectAboutTileM({
    super.key,
    required this.title,
    required this.value,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    final Styles nunito = Styles.nunito();
    return Column(
      children: [
        Text(
          title,
          style: nunito.boldText(fontSize: 14, color: Colors.grey[400]!),
        ),
        const SizedBox(height: 10),
        icon,
        // SvgPicture.asset(
        //   Assets.company,
        //   color: Colors.white,
        // ),
        const SizedBox(height: 10),
        Text(
          value,
          style: nunito.mediumText(fontSize: 14, color: Colors.grey[400]!),
        ),
      ],
    );
  }
}
