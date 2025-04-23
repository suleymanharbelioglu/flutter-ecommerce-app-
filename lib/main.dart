import 'package:ecommerce/core/configs/theme/app_theme.dart';
import 'package:ecommerce/presentation/splash/pages/splash.dart';
import 'package:ecommerce/service_locator.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.appTheme,
      debugShowCheckedModeBanner: false,
      home: const SplashPage(),
    );
  }
}
