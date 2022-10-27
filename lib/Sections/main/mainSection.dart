import 'package:portfolio/animations/entranceFader.dart';
import 'package:portfolio/configs/app.dart';
import 'package:portfolio/configs/configs.dart';
import 'package:portfolio/provider/appProvider.dart';
import 'package:portfolio/provider/drawerProvider.dart';
import 'package:portfolio/provider/scrollProvider.dart';
import 'package:portfolio/responsive/responsive.dart';
import 'package:portfolio/utils/navbarUtils.dart';
import 'package:portfolio/utils/utils.dart';
import 'package:portfolio/widget/navBarActionbtn.dart';
import 'package:portfolio/widget/navbarlogo.dart';
import 'package:provider/provider.dart';

import 'package:universal_html/html.dart' as html;
import 'package:flutter/material.dart';
import 'package:portfolio/constants.dart';
import 'package:portfolio/widget/arrowOnTop.dart';

part 'widgets/_navBarDesktop.dart';
part 'widgets/_mobileDrawer.dart';
part 'widgets/_body.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    App.init(context);
    final drawerProvider = Provider.of<DrawerProvider>(context);

    return Scaffold(
      key: drawerProvider.key,
      extendBodyBehindAppBar: true,
      drawer: !Responsive.isDesktop(context) ? const _MobileDrawer() : null,
      body: SafeArea(
        child: Stack(
          children: [
            const _Body(),
            const ArrowOnTop(),
            Responsive.isTablet(context) || Responsive.isMobile(context)
                ? const _NavBarTablet()
                : const _NavbarDesktop(),
          ],
        ),
      ),
    );
  }
}
