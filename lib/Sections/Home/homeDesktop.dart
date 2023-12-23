import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/animations/entranceFader.dart';
import 'package:portfolio/configs/configs.dart';

import 'package:portfolio/utils/utils.dart';
import 'package:portfolio/widget/socialLinks.dart';

class HomeDesktop extends StatelessWidget {
  const HomeDesktop({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      height: size.height * 1.025,
      padding: Space.h,
      child: Stack(
        children: [
          Positioned(
            bottom: 0,
            right: 0,
            child: Opacity(
              opacity: 0.9,
              child: EntranceFader(
                offset: const Offset(0, 0),
                delay: const Duration(seconds: 1),
                duration: const Duration(milliseconds: 800),
                child: Image.asset(
                  StaticUtils.blackWhitePhoto,
                  height: size.width < 1200
                      ? size.height * 0.8
                      : size.height * 0.85,
                ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(
              AppDimensions.normalize(30),
              AppDimensions.normalize(80),
              0,
              0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'WELCOME TO MY PORTFOLIO! ',
                      style: AppText.b1!.copyWith(
                        fontFamily: 'Montserrat',
                      ),
                    ),
                    EntranceFader(
                      offset: const Offset(0, 0),
                      delay: const Duration(seconds: 2),
                      duration: const Duration(milliseconds: 800),
                      child: Image.asset(
                        StaticUtils.hi,
                        height: AppDimensions.normalize(12),
                      ),
                    ),
                  ],
                ),
                Space.y1!,
                Text(
                  "Ashutosh",
                  style: AppText.h1!.copyWith(
                    fontFamily: 'Montserrat',
                    fontSize: AppDimensions.normalize(25),
                    fontWeight: FontWeight.w100,
                  ),
                ),
                Text(
                  "Kapoor",
                  style: AppText.h1b!.copyWith(
                    fontSize: AppDimensions.normalize(25),
                    height: 1,
                  ),
                ),
                EntranceFader(
                  offset: const Offset(-10, 0),
                  delay: const Duration(seconds: 1),
                  duration: const Duration(milliseconds: 800),
                  child: Row(
                    children: [
                      Icon(
                        Icons.play_arrow_rounded,
                        color: AppTheme.c!.primary!,
                      ),
                      AnimatedTextKit(
                        animatedTexts: [
                          TyperAnimatedText(
                            ' Flutter Developer',
                            speed: const Duration(milliseconds: 50),
                            textStyle: AppText.b1,
                          ),
                          TyperAnimatedText(
                            ' Collaboration Manager :)',
                            speed: const Duration(milliseconds: 50),
                            textStyle: AppText.b1,
                          ),
                          TyperAnimatedText(
                            ' Web Developer ',
                            speed: const Duration(milliseconds: 50),
                            textStyle: AppText.b1,
                          ),
                        ],
                        isRepeatingAnimation: true,
                      ),
                    ],
                  ),
                ),
                Space.y2!,
                const SocialLinks(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
