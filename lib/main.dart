import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:mauritania/Features/botNavBar/presentation/views/botNavBar_screen.dart';
import 'package:mauritania/Features/home/presentation/view/widgets/advertisement_details.dart';
import 'package:mauritania/Features/login/presentation/views/login_screen.dart';
import 'package:mauritania/Features/register/presentation/views/register_screen.dart';
import 'package:mauritania/Features/register/presentation/views/widgets/upload_documents_screen_body.dart';
import 'package:mauritania/Features/splash/presentation/views/splash_screen.dart';

import 'Features/register/presentation/views/upload_documents_screen.dart';
import 'core/theme/theme.dart';
import 'generated/l10n.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
        locale: const Locale('ar'),
      debugShowCheckedModeBanner: false,
      theme:  AppTheme.theme,
      home: BotNavBarScreen()
    );
  }
}
