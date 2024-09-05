import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kapoor_0905/responsive.dart';
import 'package:kapoor_0905/views/home/homeDesktop.dart';
import 'package:kapoor_0905/views/home/homeMobile.dart';

class Home extends ConsumerStatefulWidget {
  const Home({super.key});

  @override
  ConsumerState<Home> createState() => _HomeState();
}

class _HomeState extends ConsumerState<Home> {
  @override
  Widget build(BuildContext context) {
    return const Responsive(desktop: HomeDesktop(), mobile: HomeMobile());
  }
}
