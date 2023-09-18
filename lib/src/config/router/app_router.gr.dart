// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i5;
import 'package:flutter/material.dart' as _i7;
import 'package:flutter_clean_architecture/src/features/listings/domain/entities/listings_entity/listings_entity.dart'
    as _i6;
import 'package:flutter_clean_architecture/src/features/listings/presentation/views/listings_detail_view.dart'
    as _i1;
import 'package:flutter_clean_architecture/src/features/listings/presentation/views/listings_view.dart'
    as _i2;
import 'package:flutter_clean_architecture/src/features/splash/view/splash_view.dart'
    as _i3;
import 'package:flutter_clean_architecture/src/features/vcs/presentation/views/vc_view.dart'
    as _i4;

abstract class $AppRouter extends _i5.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i5.PageFactory> pagesMap = {
    ListingsDetailRoute.name: (routeData) {
      final args = routeData.argsAs<ListingsDetailRouteArgs>();
      return _i5.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i1.ListingsDetailView(
          listings: args.listings,
          key: args.key,
        ),
      );
    },
    ListingsRoute.name: (routeData) {
      return _i5.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.ListingsView(),
      );
    },
    SplashRoute.name: (routeData) {
      return _i5.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.SplashView(),
      );
    },
    VcRoute.name: (routeData) {
      final args = routeData.argsAs<VcRouteArgs>();
      return _i5.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i4.VcView(
          id: args.id,
          key: args.key,
        ),
      );
    },
  };
}

/// generated route for
/// [_i1.ListingsDetailView]
class ListingsDetailRoute extends _i5.PageRouteInfo<ListingsDetailRouteArgs> {
  ListingsDetailRoute({
    required _i6.ListingsEntity listings,
    _i7.Key? key,
    List<_i5.PageRouteInfo>? children,
  }) : super(
          ListingsDetailRoute.name,
          args: ListingsDetailRouteArgs(
            listings: listings,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'ListingsDetailRoute';

  static const _i5.PageInfo<ListingsDetailRouteArgs> page =
      _i5.PageInfo<ListingsDetailRouteArgs>(name);
}

class ListingsDetailRouteArgs {
  const ListingsDetailRouteArgs({
    required this.listings,
    this.key,
  });

  final _i6.ListingsEntity listings;

  final _i7.Key? key;

  @override
  String toString() {
    return 'ListingsDetailRouteArgs{listings: $listings, key: $key}';
  }
}

/// generated route for
/// [_i2.ListingsView]
class ListingsRoute extends _i5.PageRouteInfo<void> {
  const ListingsRoute({List<_i5.PageRouteInfo>? children})
      : super(
          ListingsRoute.name,
          initialChildren: children,
        );

  static const String name = 'ListingsRoute';

  static const _i5.PageInfo<void> page = _i5.PageInfo<void>(name);
}

/// generated route for
/// [_i3.SplashView]
class SplashRoute extends _i5.PageRouteInfo<void> {
  const SplashRoute({List<_i5.PageRouteInfo>? children})
      : super(
          SplashRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static const _i5.PageInfo<void> page = _i5.PageInfo<void>(name);
}

/// generated route for
/// [_i4.VcView]
class VcRoute extends _i5.PageRouteInfo<VcRouteArgs> {
  VcRoute({
    required String id,
    _i7.Key? key,
    List<_i5.PageRouteInfo>? children,
  }) : super(
          VcRoute.name,
          args: VcRouteArgs(
            id: id,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'VcRoute';

  static const _i5.PageInfo<VcRouteArgs> page = _i5.PageInfo<VcRouteArgs>(name);
}

class VcRouteArgs {
  const VcRouteArgs({
    required this.id,
    this.key,
  });

  final String id;

  final _i7.Key? key;

  @override
  String toString() {
    return 'VcRouteArgs{id: $id, key: $key}';
  }
}
