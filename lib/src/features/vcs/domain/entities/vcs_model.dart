import 'package:flutter_clean_architecture/src/features/vcs/domain/entities/coin_model.dart';

class VcsEntity {
  VcsEntity({
    this.id,
    this.name,
    this.title,
    this.description,
    this.numTokens,
    this.lastUpdated,
    this.avgPriceChange,
    this.marketCap,
    this.marketCapChange,
    this.volume,
    this.volumeChange,
    this.coins,
  });

  String? id;
  String? name;
  String? title;
  String? description;
  int? numTokens;
  DateTime? lastUpdated;
  double? avgPriceChange;
  double? marketCap;
  double? marketCapChange;
  double? volume;
  double? volumeChange;
  List<CoinEntity>? coins;
}
