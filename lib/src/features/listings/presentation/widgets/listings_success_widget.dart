import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean_architecture/src/config/router/app_router.gr.dart';
import 'package:flutter_clean_architecture/src/core/extension/currenct_extension.dart';
import 'package:flutter_clean_architecture/src/core/extension/up_or_down_color_extension.dart';
import 'package:flutter_clean_architecture/src/features/listings/presentation/cubits/get_listings/get_listings_cubit.dart';

class ListingsSuccessWidget extends StatefulWidget {
  const ListingsSuccessWidget({
    required this.state,
    super.key,
  });

  final GetListingsSuccess state;

  @override
  State<ListingsSuccessWidget> createState() => _ListingsSuccessWidgetState();
}

class _ListingsSuccessWidgetState extends State<ListingsSuccessWidget> {
  late ScrollController scrollController;

  @override
  void initState() {
    super.initState();
    scrollController = ScrollController()..addListener(scrollListener);
  }

  @override
  void dispose() {
    super.dispose();
    scrollController
      ..removeListener(scrollListener)
      ..dispose();
  }

  void scrollListener() {
    if (scrollController.offset >= scrollController.position.maxScrollExtent &&
        !scrollController.position.outOfRange) {
      context.read<GetListingsCubit>().getMoreListings();
    }
  }

  @override
  Widget build(BuildContext context) {
    final listings = widget.state.listings;

    return ListView(
      controller: scrollController,
      children: [
        ListView.builder(
          shrinkWrap: true,
          itemCount: listings?.length,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            final tokens = listings![index];

            return ListTile(
              onTap: () {
                context.router.push(ListingsDetailRoute(listings: tokens));
              },
              leading: Text('${index + 1}'),
              title: Text(
                tokens.symbol!,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(tokens.name!),
              trailing: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    tokens.quote?.usd?.price?.formatAsCurrency() ?? '',
                    style: TextStyle(
                      fontSize: 16,
                      color: tokens.quote?.usd?.percentChange24h?.upOrDownColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    '% ${tokens.quote?.usd?.percentChange24h?.toStringAsFixed(2)}',
                    style: TextStyle(
                      color: tokens.quote?.usd?.percentChange24h?.upOrDownColor,
                    ),
                  ),
                ],
              ),
            );
          },
        ),
        if (!context.watch<GetListingsCubit>().hasReachedMax) ...[
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 20),
            child: Center(child: CircularProgressIndicator()),
          ),
        ],
      ],
    );
  }
}
