import 'package:flutter/material.dart';
import 'package:games_hub/router/app_routes.dart';
import 'package:games_hub/theme/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'GamesHub',
      theme: AppTheme.instance.apptheme,
      routerConfig: AppRoutes.instance.router,
    );
  }
}
