import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/l10n/l10n.dart';
import 'package:flutter_clean_architecture/src/core/components/row/row_tile.dart';
import 'package:flutter_clean_architecture/src/core/extension/currency_extension.dart';
import 'package:flutter_clean_architecture/src/core/extension/date_time_extension.dart';
import 'package:flutter_clean_architecture/src/core/extension/oridinal_number_extendion.dart';
import 'package:flutter_clean_architecture/src/features/vcs/domain/entities/coin_model.dart';
import 'package:flutter_clean_architecture/src/features/vcs/domain/entities/vcs_model.dart';
import 'package:flutter_clean_architecture/src/features/vcs/presentation/cubits/get_vc/get_vc_data_cubit.dart';

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
            title: context.l10n.lastUpdated,
            value: vc.lastUpdated!.toFormattedString(),
          ),
          RowTile(
            title: context.l10n.numberOfTokens,
            value: vc.numTokens?.toString() ?? '',
          ),
          RowTile(
            title: context.l10n.marketCap,
            value: vc.marketCap?.formatAsCurrency() ?? '',
          ),
          RowTile(
            title: context.l10n.volume,
            value: vc.volume?.formatAsCurrency() ?? '',
          ),
          const SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                context.l10n.coins,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                context.l10n.cmcRank,
                style: const TextStyle(
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
