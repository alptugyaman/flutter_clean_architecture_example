import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean_architecture/src/core/extension/currency_extension.dart';
import 'package:flutter_clean_architecture/src/core/extension/up_or_down_color_extension.dart';
import 'package:flutter_clean_architecture/src/features/listings/domain/entities/listings_entity/listings_entity.dart';
import 'package:flutter_clean_architecture/src/features/listings/domain/usecases/listings_usecase.dart';
import 'package:flutter_clean_architecture/src/features/listings/presentation/cubits/get_token/get_token_cubit.dart';
import 'package:flutter_clean_architecture/src/injector.dart';

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
      body: BlocProvider(
        create: (_) => GetTokenCubit(injector<ListingsUsecase>()),
        child: _ListingsDetailView(listings: listings),
      ),
    );
  }
}

class _ListingsDetailView extends StatefulWidget {
  const _ListingsDetailView({
    required this.listings,
  });

  final ListingsEntity listings;

  @override
  State<_ListingsDetailView> createState() => _ListingsDetailViewState();
}

class _ListingsDetailViewState extends State<_ListingsDetailView> {
  @override
  void initState() {
    super.initState();
    context.read<GetTokenCubit>().getToken(widget.listings.id.toString());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetTokenCubit, GetTokenState>(
      builder: (context, state) {
        if (state is GetTokenSuccess) {
          final token = state.token;
          return ListView(
            padding: const EdgeInsets.all(20),
            children: [
              Row(
                children: [
                  Image.network(
                    token.logo ?? '',
                    width: 50,
                    height: 50,
                  ),
                  const SizedBox(width: 20),
                  Text(
                    token.name ?? '',
                    style: const TextStyle(
                      fontSize: 32,
                    ),
                  ),
                  const Spacer(),
                  Text(
                    widget.listings.quote?.usd?.price?.formatAsCurrency() ?? '',
                    style: TextStyle(
                      fontSize: 24,
                      color: widget
                          .listings.quote?.usd?.percentChange24h?.upOrDownColor,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Text(
                token.description ?? '',
                style: const TextStyle(fontSize: 14),
              ),
              const SizedBox(height: 20),
              const Divider(),
              ...token.tagNames!.map(Text.new),
            ],
          );
        } else if (state is GetTokenError) {
          return Center(child: Text(state.message));
        }

        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}
