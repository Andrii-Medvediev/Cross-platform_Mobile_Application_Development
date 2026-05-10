import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import '../../features/queue/presentation/client_details_screen.dart';
import '../../features/queue/presentation/queue_riverpod_screen.dart';
import '../../features/queue/presentation/queue_screen.dart';

part 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
    AutoRoute(page: QueueRoute.page, initial: true),
    AutoRoute(page: QueueRiverpodRoute.page),
    AutoRoute(page: ClientDetailsRoute.page),
  ];
}
