// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

/// generated route for
/// [ClientDetailsScreen]
class ClientDetailsRoute extends PageRouteInfo<ClientDetailsRouteArgs> {
  ClientDetailsRoute({
    Key? key,
    required String clientName,
    required int queueNumber,
    required String status,
    List<PageRouteInfo>? children,
  }) : super(
         ClientDetailsRoute.name,
         args: ClientDetailsRouteArgs(
           key: key,
           clientName: clientName,
           queueNumber: queueNumber,
           status: status,
         ),
         initialChildren: children,
       );

  static const String name = 'ClientDetailsRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ClientDetailsRouteArgs>();
      return ClientDetailsScreen(
        key: args.key,
        clientName: args.clientName,
        queueNumber: args.queueNumber,
        status: args.status,
      );
    },
  );
}

class ClientDetailsRouteArgs {
  const ClientDetailsRouteArgs({
    this.key,
    required this.clientName,
    required this.queueNumber,
    required this.status,
  });

  final Key? key;

  final String clientName;

  final int queueNumber;

  final String status;

  @override
  String toString() {
    return 'ClientDetailsRouteArgs{key: $key, clientName: $clientName, queueNumber: $queueNumber, status: $status}';
  }
}

/// generated route for
/// [HomeScreen]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute({List<PageRouteInfo>? children})
    : super(HomeRoute.name, initialChildren: children);

  static const String name = 'HomeRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const HomeScreen();
    },
  );
}

/// generated route for
/// [ServiceSelectionScreen]
class ServiceSelectionRoute extends PageRouteInfo<void> {
  const ServiceSelectionRoute({List<PageRouteInfo>? children})
    : super(ServiceSelectionRoute.name, initialChildren: children);

  static const String name = 'ServiceSelectionRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const ServiceSelectionScreen();
    },
  );
}
