import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean_architecture/l10n/l10n.dart';
import 'package:flutter_clean_architecture/src/config/router/app_router.gr.dart';
import 'package:flutter_clean_architecture/src/core/constants/string_constants.dart';
import 'package:flutter_clean_architecture/src/core/localization/locale_provider.dart';
import 'package:flutter_clean_architecture/src/features/listings/domain/usecases/listings_usecase.dart';
import 'package:flutter_clean_architecture/src/features/listings/presentation/cubits/get_listings/get_listings_cubit.dart';
import 'package:flutter_clean_architecture/src/features/listings/presentation/widgets/change_localization_widget.dart';
import 'package:flutter_clean_architecture/src/features/listings/presentation/widgets/listings_success_widget.dart';
import 'package:flutter_clean_architecture/src/injector.dart';

@RoutePage()
class ListingsView extends StatelessWidget {
  const ListingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => GetListingsCubit(injector<ListingsUsecase>()),
      child: const _ListingsView(),
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
    context.read<GetListingsCubit>().getListings();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          context.l10n.cleanArchitectureExample,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: const [
          ChangeLocalizationWidget(),
        ],
      ),
      body: BlocBuilder<GetListingsCubit, GetListingsState>(
        builder: (context, state) {
          if (state is GetListingsSuccess) {
            return ListingsSuccessWidget(state: state);
          } else if (state is GetListingsEmpty) {
            return Center(child: Text(context.l10n.emptyList));
          } else if (state is GetListingsError) {
            return Center(child: Text(state.errorMessage));
          }

          return const Center(child: CircularProgressIndicator());
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        label: Text(context.l10n.a16zPortfolio),
        onPressed: () {
          context.router.push(VcRoute(id: StringContants.a16zId));
        },
      ),
    );
  }
}
