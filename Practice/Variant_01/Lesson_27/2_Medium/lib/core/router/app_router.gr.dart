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
    required int clientId,
    List<PageRouteInfo>? children,
  }) : super(
         ClientDetailsRoute.name,
         args: ClientDetailsRouteArgs(key: key, clientId: clientId),
         initialChildren: children,
       );

  static const String name = 'ClientDetailsRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ClientDetailsRouteArgs>();
      return ClientDetailsScreen(key: args.key, clientId: args.clientId);
    },
  );
}

class ClientDetailsRouteArgs {
  const ClientDetailsRouteArgs({this.key, required this.clientId});

  final Key? key;

  final int clientId;

  @override
  String toString() {
    return 'ClientDetailsRouteArgs{key: $key, clientId: $clientId}';
  }
}

/// generated route for
/// [QueueScreen]
class QueueRoute extends PageRouteInfo<void> {
  const QueueRoute({List<PageRouteInfo>? children})
    : super(QueueRoute.name, initialChildren: children);

  static const String name = 'QueueRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const QueueScreen();
    },
  );
}
