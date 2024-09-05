import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kapoor_0905/firebase_options.dart';
import 'package:kapoor_0905/splash.dart';

Future<void> main() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.black, // Status bar color
    ));
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Ashutosh Kapoor',
      theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
          useMaterial3: true,
          bottomSheetTheme: const BottomSheetThemeData(
            backgroundColor: Colors.transparent,
          ),
          bottomAppBarTheme:
              const BottomAppBarTheme(color: Colors.transparent)),
      home: const Splash(),
    );
  }
}
