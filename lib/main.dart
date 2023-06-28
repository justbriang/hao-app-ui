import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:hao_app/routing/app_router.dart';
import 'package:hao_app/routing/app_state_manager.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _appStateManager = AppStateManager();

  late AppRouter _appRouter;

  @override
  void initState() {
    _appRouter = AppRouter(
      appStateManager: _appStateManager,
    );
    super.initState();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => _appStateManager,
        ),
      ],
      child: Consumer<AppStateManager>(
        builder: (context, state, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            // The Mandy red, light theme.
            theme: FlexThemeData.light(scheme: FlexScheme.blue),
            // The Mandy red, dark theme.
            darkTheme: FlexThemeData.dark(scheme: FlexScheme.blue),
            // Use dark or light theme based on system setting.
            themeMode: ThemeMode.system,
            title: 'HaoApp',
            // home: const PDFTest(),
            home: Router(
              backButtonDispatcher: RootBackButtonDispatcher(),
              routerDelegate: _appRouter,
            ),
          );
        },
      ),
    );
  }
}
