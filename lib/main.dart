import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:s_booking_public/app/core/commons/common_variables.dart';
import 'package:s_booking_public/app/core/lang/languages.dart';
import 'package:s_booking_public/app/core/theme/app_theme.dart';

import 'package:flutter_localizations/flutter_localizations.dart';

import 'app/routes/app_pages.dart';

Future<void> main() async {
  await GetStorage.init();

  WidgetsFlutterBinding.ensureInitialized();

  await GetStorage.init();
  SystemChrome.setPreferredOrientations(
    <DeviceOrientation>[DeviceOrientation.portraitUp],
  ).then((_) {
    runApp(const Application());
  });
}

class Application extends StatelessWidget {
  const Application({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final String code = CommonVariables.settings.read(LANG_CODE) ?? 'ar';
    Locale? locale;

    locale = Locale(code);
    bool isDarkMode = CommonVariables.settings.read('isDarkMode') ?? false;
    return GetMaterialApp(
      title: "موعد",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      theme: appTheme,
      darkTheme: appDarkTheme,
      themeMode: isDarkMode ? ThemeMode.dark : ThemeMode.light,
      supportedLocales: const [
        Locale('en', 'US'),
        Locale('ar', 'SA'),
      ],
      debugShowCheckedModeBanner: false,
      localizationsDelegates: const <LocalizationsDelegate<dynamic>>[
        GlobalMaterialLocalizations.delegate, // uses `flutter_localizations`
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      locale: locale,
      fallbackLocale: const Locale('en', 'US'),
      translations: Languages(),
    );
  }
}