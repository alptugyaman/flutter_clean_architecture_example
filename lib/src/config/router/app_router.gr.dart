// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i3;
import 'package:flutter/material.dart' as _i5;
import 'package:flutter_clean_architecture/src/features/listings/domain/entities/listings_entity/listings_entity.dart'
    as _i4;
import 'package:flutter_clean_architecture/src/features/listings/presentation/views/listings_detail_view.dart'
    as _i1;
import 'package:flutter_clean_architecture/src/features/listings/presentation/views/listings_view.dart'
    as _i2;

abstract class $AppRouter extends _i3.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i3.PageFactory> pagesMap = {
    ListingsDetailRoute.name: (routeData) {
      final args = routeData.argsAs<ListingsDetailRouteArgs>();
      return _i3.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i1.ListingsDetailView(
          listings: args.listings,
          key: args.key,
        ),
      );
    },
    ListingsRoute.name: (routeData) {
      return _i3.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.ListingsView(),
      );
    },
  };
}

/// generated route for
/// [_i1.ListingsDetailView]
class ListingsDetailRoute extends _i3.PageRouteInfo<ListingsDetailRouteArgs> {
  ListingsDetailRoute({
    required _i4.ListingsEntity listings,
    _i5.Key? key,
    List<_i3.PageRouteInfo>? children,
  }) : super(
          ListingsDetailRoute.name,
          args: ListingsDetailRouteArgs(
            listings: listings,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'ListingsDetailRoute';

  static const _i3.PageInfo<ListingsDetailRouteArgs> page =
      _i3.PageInfo<ListingsDetailRouteArgs>(name);
}

class ListingsDetailRouteArgs {
  const ListingsDetailRouteArgs({
    required this.listings,
    this.key,
  });

  final _i4.ListingsEntity listings;

  final _i5.Key? key;

  @override
  String toString() {
    return 'ListingsDetailRouteArgs{listings: $listings, key: $key}';
  }
}

/// generated route for
/// [_i2.ListingsView]
class ListingsRoute extends _i3.PageRouteInfo<void> {
  const ListingsRoute({List<_i3.PageRouteInfo>? children})
      : super(
          ListingsRoute.name,
          initialChildren: children,
        );

  static const String name = 'ListingsRoute';

  static const _i3.PageInfo<void> page = _i3.PageInfo<void>(name);
}
