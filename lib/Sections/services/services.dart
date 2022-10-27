import 'package:carousel_slider/carousel_slider.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/configs/configs.dart';
import 'package:portfolio/constants.dart';
import 'package:portfolio/provider/appProvider.dart';
import 'package:portfolio/responsive/responsive.dart';
import 'package:portfolio/utils/servicesUtils.dart';
import 'package:portfolio/utils/utils.dart';
import 'package:portfolio/widget/customtexthead.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

part 'servicesDesktop.dart';
part 'servicesMobile.dart';

part 'widgets/_servicesCard.dart';
part 'widgets/_services_card_back.dart'; //lib\Sections\services\widgets\_servicescardBack.dart

class Services extends StatelessWidget {
  const Services({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Responsive(
      mobile: ServiceMobile(),
      tablet: ServiceMobile(),
      desktop: ServiceDesktop(),
    );
  }
}
