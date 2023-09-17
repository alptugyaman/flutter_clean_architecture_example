import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean_architecture/src/core/extension/currenct_extension.dart';
import 'package:flutter_clean_architecture/src/core/extension/date_time_extension.dart';
import 'package:flutter_clean_architecture/src/core/extension/oridinal_number_extendion.dart';
import 'package:flutter_clean_architecture/src/features/vcs/domain/entities/coin_model.dart';
import 'package:flutter_clean_architecture/src/features/vcs/domain/entities/vcs_model.dart';
import 'package:flutter_clean_architecture/src/features/vcs/domain/usecases/vcs_usecase.dart';
import 'package:flutter_clean_architecture/src/features/vcs/presentation/cubits/get_vc/get_vc_data_cubit.dart';
import 'package:flutter_clean_architecture/src/injector.dart';

@RoutePage()
class VcView extends StatelessWidget {
  const VcView({
    required this.id,
    super.key,
  });

  final String id;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => GetVcDataCubit(injector<VcsUsecase>()),
      child: _VcView(id: id),
    );
  }
}

class _VcView extends StatefulWidget {
  const _VcView({required this.id});

  final String id;

  @override
  State<_VcView> createState() => __VcViewState();
}

class __VcViewState extends State<_VcView> {
  String get vcId => widget.id;

  @override
  void initState() {
    super.initState();
    context.read<GetVcDataCubit>().getVc(id: vcId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'a16z Portfolio',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: BlocBuilder<GetVcDataCubit, GetVcDataState>(
        builder: (context, state) {
          if (state is GetVcDataSuccess) {
            return PortfolioWidget(state: state);
          } else if (state is GetVcDataEmpty) {
            return const Center(child: Text('Empty'));
          } else if (state is GetVcDataError) {
            return Center(child: Text(state.errorMessage));
          }

          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}

class PortfolioWidget extends StatelessWidget {
  const PortfolioWidget({
    required this.state,
    super.key,
  });

  final GetVcDataSuccess state;

  VcsEntity get vc => state.vc;
  List<CoinEntity>? get coins => state.coinList;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: ListView(
        children: [
          RowTile(
            title: 'Last Updated:',
            value: vc.lastUpdated!.toFormattedString(),
          ),
          RowTile(
            title: 'Number of Tokens:',
            value: vc.numTokens?.toString() ?? '',
          ),
          RowTile(
            title: 'Market Cap:',
            value: vc.marketCap?.formatAsCurrency() ?? '',
          ),
          RowTile(
            title: 'Volume:',
            value: vc.volume?.formatAsCurrency() ?? '',
          ),
          const SizedBox(height: 30),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Coins',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'CMC Rank',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const Divider(),
          ...vc.coins!.map(
            (e) => RowTile(
              title: e.name!,
              value: e.cmcRank?.toOridinalNumber() ?? '',
            ),
          ),
        ],
      ),
    );
  }
}

class RowTile extends StatelessWidget {
  const RowTile({
    required this.title,
    required this.value,
    super.key,
  });

  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    const textStyle = TextStyle(fontWeight: FontWeight.bold);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: textStyle,
          ),
          Text(
            value,
            style: textStyle,
          ),
        ],
      ),
    );
  }
}
