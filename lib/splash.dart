import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kapoor_0905/utils/assets.dart';
import 'package:kapoor_0905/utils/extensions.dart';
import 'package:kapoor_0905/views/home/home.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      nextPageFade(context: context, page: const Home());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Row(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                Assets.appleIcon,
                width: 60,
              )
            ],
          ).expanded(),
        ],
      ),
    );
  }
}

nextPageFade({required BuildContext context, required Widget page}) {
  return Navigator.push(
    context,
    PageRouteBuilder(
      pageBuilder: (_, __, ___) => page,
      transitionsBuilder: (_, animation, __, child) {
        // Apply a curve and increase the duration for a smoother effect
        final curvedAnimation = CurvedAnimation(
          parent: animation,
          curve: Curves.easeInOut, // Smoother curve
        );

        return FadeTransition(
          opacity: curvedAnimation,
          child: child,
        );
      },
      transitionDuration: const Duration(milliseconds: 500), // Longer duration
    ),
  );
}
