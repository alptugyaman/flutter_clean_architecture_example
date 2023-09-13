import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean_architecture/src/features/listings/domain/usecases/listings_usecase.dart';
import 'package:flutter_clean_architecture/src/features/listings/presentation/cubits/cubit/get_listings_cubit.dart';
import 'package:flutter_clean_architecture/src/injector.dart';

class ListingsView extends StatelessWidget {
  const ListingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (_) => GetListingsCubit(injector<ListingsUsecase>()),
        child: const _ListingsView(),
      ),
    );
  }
}

class _ListingsView extends StatefulWidget {
  const _ListingsView();

  @override
  State<_ListingsView> createState() => _ListingsViewState();
}

class _ListingsViewState extends State<_ListingsView> {
  late ScrollController scrollController;

  @override
  void initState() {
    super.initState();
    scrollController = ScrollController()..addListener(scrollListener);

    context.read<GetListingsCubit>().getListings();
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
    final listings = context.watch<GetListingsCubit>().listings;

    return BlocBuilder<GetListingsCubit, GetListingsState>(
      builder: (context, state) {
        if (state is GetListingsSuccess) {
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
                    title: Text(tokens.symbol!),
                    subtitle: Text(tokens.name!),
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
        } else if (state is GetListingsEmpty) {
          return const Center(child: Text('Empty'));
        } else if (state is GetListingsError) {
          return Center(child: Text(state.errorMessage));
        }

        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}
