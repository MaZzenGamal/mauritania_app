import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:mauritania/Features/botNavBar/presentation/views/botNavBar_screen.dart';
import 'package:mauritania/Features/language/presentation/views/language_selection_screen.dart';
import 'package:mauritania/Features/splash/presentation/views/splash_screen.dart';
import 'core/theme/theme.dart';
import 'generated/l10n.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Locale _locale = const Locale('ar'); // Default locale

  void _onLanguageChanged(Locale newLocale) {
    setState(() {
      _locale = newLocale;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      locale: _locale,
      debugShowCheckedModeBanner: false,
      theme: AppTheme.theme,
      home: //BotNavBarScreen()
      SplashScreen(
        onLanguageChanged: _onLanguageChanged,
        currentLocale: _locale, // Pass the current locale
      ),
    );
  }
}