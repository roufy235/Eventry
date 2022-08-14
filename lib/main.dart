import 'package:dynamic_color/dynamic_color.dart';
import 'package:eventry/firebase_options.dart';
import 'package:eventry/router/app_router.dart';
import 'package:eventry/utils/colors.dart';
import 'package:eventry/utils/dimens.dart';
import 'package:eventry/utils/myFunctions.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await Hive.initFlutter();
  await Hive.openBox(boxName);
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  final GoRouter _goRouter = AppRouter().router;

  @override
  Widget build(BuildContext context) {
    return DynamicColorBuilder(
      builder: (ColorScheme? lightDynamic, ColorScheme? darkDynamic) {
        ColorScheme lightColorScheme;
        ColorScheme darkColorScheme;

        // if (lightDynamic != null && darkDynamic != null) {
        //   lightColorScheme = lightDynamic.harmonized()..copyWith();
        //   lightColorScheme = lightColorScheme.copyWith(secondary: brandColor);
        //   darkColorScheme = darkDynamic.harmonized();
        // } else {
        //   lightColorScheme = ColorScheme.fromSeed(seedColor: brandColor);
        //   darkColorScheme = ColorScheme.fromSeed(seedColor: brandColorD, brightness: Brightness.dark);
        // }

        lightColorScheme = ColorScheme.fromSeed(seedColor: brandColor);
        darkColorScheme = ColorScheme.fromSeed(seedColor: brandColorD, brightness: Brightness.dark);

        return MaterialApp.router(
          debugShowCheckedModeBanner: false,
          title: appName,
          theme: ThemeData(
            scaffoldBackgroundColor: colorWhite,
            useMaterial3: true,
            colorScheme: lightColorScheme,
            elevatedButtonTheme: ElevatedButtonThemeData(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  primary: lightColorScheme.primary,
                  onPrimary: lightColorScheme.onPrimary,
                )
            ),
            textButtonTheme: TextButtonThemeData(
                style: OutlinedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  primary: lightColorScheme.primary,
                )
            ),
            outlinedButtonTheme: OutlinedButtonThemeData(
              style: OutlinedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                primary: lightColorScheme.primary,
                side: BorderSide(width: 1.0, color: lightColorScheme.primary, style: BorderStyle.solid,),
              )
            ),
            appBarTheme: const AppBarTheme(
              backgroundColor: colorWhite,
              //foregroundColor: colorWhite,
              elevation: 0,
            ),
            textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme),
          ),
          darkTheme: ThemeData(
            scaffoldBackgroundColor: brandColorDark,
            elevatedButtonTheme: ElevatedButtonThemeData(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  primary: brandColorD,
                  onPrimary: colorWhite,
                )
            ),
            textButtonTheme: TextButtonThemeData(
                style: OutlinedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  primary: brandColorD,
                )
            ),
            outlinedButtonTheme: OutlinedButtonThemeData(
                style: OutlinedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  primary: brandColorD,
                  side: BorderSide(width: 1.0, color: lightColorScheme.primary, style: BorderStyle.solid,),
                )
            ),
            appBarTheme: const AppBarTheme(
              backgroundColor: brandColorDark,
              //foregroundColor: colorWhite,
              elevation: 0,
            ),
            useMaterial3: true,
            colorScheme: darkColorScheme,
            textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).primaryTextTheme),
          ),
          routerDelegate: _goRouter.routerDelegate,
          routeInformationParser: _goRouter.routeInformationParser,
          routeInformationProvider: _goRouter.routeInformationProvider,
        );
      }
    );
  }
}

