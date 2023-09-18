import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/src/config/router/app_router.gr.dart';
import 'package:flutter_clean_architecture/src/core/constants/image_path_constants.dart';
import 'package:flutter_clean_architecture/src/core/constants/string_constants.dart';
import 'package:flutter_clean_architecture/src/core/localization/locale_provider.dart';
import 'package:provider/provider.dart';

@RoutePage()
class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    initLocalization();
  }

  Future<void> initLocalization() async {
    await context.read<LocaleProvider>().initLocale();
    await Future.delayed(const Duration(seconds: 1), () async {
      await context.router.replace(const ListingsRoute());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Stack(
        children: [
          Center(
            child: Image.asset(
              ImagePath.logo,
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 32),
              child: Text(
                StringContants.envorinment,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
