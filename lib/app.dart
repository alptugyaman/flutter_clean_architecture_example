import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/l10n/l10n.dart';
import 'package:flutter_clean_architecture/src/config/router/app_router.dart';
import 'package:flutter_clean_architecture/src/core/localization/locale_provider.dart';
import 'package:flutter_clean_architecture/src/core/theme/app_theme.dart';
import 'package:flutter_clean_architecture/src/injector.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    final appRouter = AppRouter();

    return ChangeNotifierProvider(
      create: (context) => LocaleProvider(),
      builder: (context, child) {
        return Consumer<LocaleProvider>(
          builder: (context, value, child) {
            return MaterialApp.router(
              routerConfig: appRouter.config(),
              theme: injector<AppTheme>().theme,
              locale: value.locale,
              localizationsDelegates: const [
                AppLocalizations.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              supportedLocales: AppLocalizations.supportedLocales,
            );
          },
        );
      },
    );
  }
}
