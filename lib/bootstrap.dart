import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_clean_architecture/src/core/constants/string_constants.dart';
import 'package:flutter_clean_architecture/src/injector.dart' as di;
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_loggy/flutter_loggy.dart';
import 'package:loggy/loggy.dart';

class AppBlocObserver extends BlocObserver {
  const AppBlocObserver();

  @override
  void onChange(BlocBase<dynamic> bloc, Change<dynamic> change) {
    super.onChange(bloc, change);
  }

  @override
  void onError(BlocBase<dynamic> bloc, Object error, StackTrace stackTrace) {
    logInfo('onError(${bloc.runtimeType}, $error, $stackTrace)');
    super.onError(bloc, error, stackTrace);
  }
}

Future<void> bootstrap(FutureOr<Widget> Function() builder) async {
  FlutterError.onError = (details) {
    logInfo(details.exceptionAsString(), details.stack);
  };

  Bloc.observer = const AppBlocObserver();
  WidgetsFlutterBinding.ensureInitialized();

  await _initialize();

  runApp(await builder());
}

Future<void> _initialize() async {
  di.init();

  Loggy.initLoggy(logPrinter: const PrettyDeveloperPrinter());

  await dotenv.load(fileName: '.env.${StringContants.envorinment}');
}
