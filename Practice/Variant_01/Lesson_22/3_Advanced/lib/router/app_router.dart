import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import '../home_screen.dart';
import '../client_details_screen.dart';
import '../service_selection_screen.dart';

part 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
    AutoRoute(page: HomeRoute.page, initial: true),
    AutoRoute(page: ClientDetailsRoute.page),
    AutoRoute(page: ServiceSelectionRoute.page),
  ];
}
