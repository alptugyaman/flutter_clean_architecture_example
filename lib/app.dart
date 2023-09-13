import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/l10n/l10n.dart';
import 'package:flutter_clean_architecture/src/core/theme/app_theme.dart';
import 'package:flutter_clean_architecture/src/features/listings/presentation/views/listings_view.dart';
import 'package:flutter_clean_architecture/src/injector.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Clean Architecture',
      theme: injector<AppTheme>().theme,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      home: const ListingsView(),
    );
  }
}
