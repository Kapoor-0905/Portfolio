import 'package:flutter/material.dart';
import 'package:portfolio/configs/appDimensions.dart';
import 'package:portfolio/configs/appTheme.dart';
import 'package:portfolio/configs/appTypography.dart';

class ToolTechWidget extends StatelessWidget {
  final String techName;

  const ToolTechWidget({Key? key, required this.techName}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.play_arrow,
          color: AppTheme.c!.primary,
          size: AppDimensions.normalize(4),
        ),
        Text(
          " $techName ",
          style: AppText.l1,
        )
      ],
    );
  }
}
