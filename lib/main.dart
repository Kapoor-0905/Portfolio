import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/provider/appProvider.dart';
import 'package:portfolio/provider/drawerProvider.dart';
import 'package:portfolio/provider/scrollProvider.dart';
import 'package:portfolio/sections/main/mainSection.dart';
import 'package:provider/provider.dart';
import 'package:url_strategy/url_strategy.dart';
import 'package:portfolio/constants.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:portfolio/configs/coreTheme.dart' as theme;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setPathUrlStrategy();

  if (kIsWeb) {
    await Firebase.initializeApp(
      options: FirebaseOptions(
        apiKey: Constants.apiKey,
        appId: Constants.appId,
        messagingSenderId: Constants.messagingSenderId,
        projectId: Constants.projectId,
      ),
    );
  }
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  MyAppState createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (_) =>
                AppProvider()), // App Provider for Theme and Language Change and other stuff like that in future updates :)
        ChangeNotifierProvider(
            create: (_) =>
                DrawerProvider()), // Drawer Provider for Drawer State Change :)
        ChangeNotifierProvider(
            create: (_) =>
                ScrollProvider()), // Scroll Provider for Scroll State Change :)
      ],
      child: Consumer<AppProvider>(
        builder: (context, value, _) => MaterialChild(
          provider: value,
        ),
      ),
    );
  }
}

class MaterialChild extends StatefulWidget {
  final AppProvider provider;
  const MaterialChild({Key? key, required this.provider}) : super(key: key);

  @override
  State<MaterialChild> createState() => _MaterialChildState();
}

class _MaterialChildState extends State<MaterialChild> {
  void initAppTheme() {
    final appProviders = AppProvider.state(context);
    appProviders.init();
  }

  @override
  void initState() {
    initAppTheme();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Ashutosh',
      theme: theme.themeLight,
      darkTheme: theme.themeDark,
      themeMode: widget.provider.themeMode, // Theme Mode
      initialRoute: "/",
      routes: {
        "/": (context) => const MainPage(),
      },
    );
  }
}
