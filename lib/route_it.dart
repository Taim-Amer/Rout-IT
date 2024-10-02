import 'package:flutter/material.dart';
import 'package:route_it27/core/utils/router/app_router.dart';
import 'package:route_it27/core/utils/theme/theme.dart';

class RouteIT extends StatelessWidget {
  const RouteIT({super.key, required this.firstView});

  final Object firstView;

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
       themeMode: ThemeMode.system,
        theme: AppTheme.lightTheme(),
        darkTheme: AppTheme.darkTheme(),
      routerConfig: AppRouter.router,
      debugShowCheckedModeBanner: false,
    );
  }
}
