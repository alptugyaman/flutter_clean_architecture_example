import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean_architecture/l10n/l10n.dart';
import 'package:flutter_clean_architecture/src/config/router/app_router.dart';
import 'package:flutter_clean_architecture/src/core/cubit/app_language/app_language_cubit.dart';
import 'package:flutter_clean_architecture/src/core/theme/app_theme.dart';
import 'package:flutter_clean_architecture/src/injector.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    final appRouter = AppRouter();
    return BlocProvider<AppLanguageCubit>(
      create: (_) => AppLanguageCubit(),
      child: BlocBuilder<AppLanguageCubit, AppLanguageState>(
        builder: (context, state) {
          return MaterialApp.router(
            debugShowCheckedModeBanner: false,
            routerConfig: appRouter.config(),
            theme: injector<AppTheme>().theme,
            locale: Locale(state.appLanguage.languageCode),
            localizationsDelegates: const [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: AppLocalizations.supportedLocales,
          );
        },
      ),
    );
  }
}
