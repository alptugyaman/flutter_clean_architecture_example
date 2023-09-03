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
  @override
  void initState() {
    super.initState();
    context.read<GetListingsCubit>().getListings(start: 1, limit: 10);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetListingsCubit, GetListingsState>(
      builder: (context, state) {
        if (state is GetListingsEmpty) {
          return const Center(child: Text('Liste Boş'));
        } else if (state is GetListingsSuccess) {
          final listings = state.listings;

          return ListView.builder(
            itemCount: state.listings?.length,
            itemBuilder: (context, index) {
              final tokens = listings![index];
              return Text(tokens.name!);
            },
          );
        }
        return state is GetListingsError
            ? Center(child: Text(state.errorMessage))
            : const Center(child: CircularProgressIndicator());
      },
    );
  }
}
