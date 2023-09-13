import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/src/features/listings/domain/entities/listings_entity/listings_entity.dart';

@RoutePage()
class ListingsDetailView extends StatelessWidget {
  const ListingsDetailView({
    required this.listings,
    super.key,
  });

  final ListingsEntity listings;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(listings.name?.toUpperCase() ?? ''),
      ),
    );
  }
}
