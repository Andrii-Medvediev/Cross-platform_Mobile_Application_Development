import 'package:flutter/material.dart';
import 'package:talker_flutter/talker_flutter.dart';
import 'core/di/injection.dart';
import 'core/router/app_router.dart';
import 'core/theme/app_theme.dart';

final _appRouter = AppRouter();

void main() {
  setupDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return TalkerWrapper(
      talker: getIt<Talker>(),
      child: MaterialApp.router(
        routerConfig: _appRouter.config(
          navigatorObservers: () => [getIt<TalkerRouteObserver>()],
        ),
        title: 'Електронна черга',
        theme: AppTheme.lightTheme(),
      ),
    );
  }
}
