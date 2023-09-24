import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:flutter_clean_architecture/src/core/constants/string_constants.dart';
import 'package:flutter_clean_architecture/src/injector.dart' as di;
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_loggy/flutter_loggy.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:loggy/loggy.dart';
import 'package:path_provider/path_provider.dart';

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

  await _initialize();

  runApp(await builder());
}

Future<void> _initialize() async {
  Bloc.observer = const AppBlocObserver();
  WidgetsFlutterBinding.ensureInitialized();

  di.init();

  Loggy.initLoggy(logPrinter: const PrettyDeveloperPrinter());

  final directory = await getApplicationDocumentsDirectory();

  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: directory,
  );

  await dotenv.load(fileName: '.env.${StringContants.envorinment}');
}
