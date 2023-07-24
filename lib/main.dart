import 'dart:developer';
import 'dart:io';

import 'package:eleven_ai/core/main_app.dart';
import 'package:eleven_ai/providers/theme_provider.dart';
import 'package:eleven_ai/screens/content/dashboard.dart';
import 'package:eleven_ai/utils/color_constants.dart';
import 'package:flutter/material.dart';
import 'package:eleven_ai/core/theme/theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Platform.isIOS ?
  await Firebase.initializeApp() :
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  )
  ;
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Consumer(
        builder: (context, ThemeProvider theme, Widget? child) {
          bool dark = theme.isDark;
          log(dark.toString());
          return AnnotatedRegion<SystemUiOverlayStyle>(
            value: SystemUiOverlayStyle(
              statusBarColor: Colors.transparent,
              statusBarIconBrightness: dark ? Brightness.dark : Brightness.light,
              systemNavigationBarColor: Colors.transparent,
              systemNavigationBarIconBrightness:
              dark ? Brightness.dark : Brightness.light,
            ),
            child:  MaterialApp(
              title: 'My AI',
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                primaryColor: AppColors.primary,

              ),
              home: const MainApp(),
            ),
          );
        });
  }
}
