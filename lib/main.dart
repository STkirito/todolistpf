import 'package:awesonestyle/awesonestyle.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:todolistpf/src/routers/routers.dart';
import 'package:todolistpf/src/translate/app_translation.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends GetView {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarBrightness: Brightness.light,
    ));
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return GetMaterialApp(
      locale: Get.deviceLocale,
      fallbackLocale: const Locale('es', 'ES'),
      translationsKeys: AppTranslation.translationsKeys,
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en', ''),
        Locale('es', ''),
      ],
      debugShowCheckedModeBanner: false,
      initialRoute: '/auth/login',
      navigatorKey: Get.key,
      getPages: routers,
    );
  }
}
