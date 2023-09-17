import 'package:flutter_clean_architecture/src/features/vcs/data/models/coin_model.dart';
import 'package:flutter_clean_architecture/src/features/vcs/domain/entities/vcs_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'vcs_model.g.dart';

@JsonSerializable(createToJson: false)
class VcsModel {
  VcsModel({
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

  factory VcsModel.fromJson(Map<String, dynamic> json) {
    return _$VcsModelFromJson(json);
  }

  String? id;
  String? name;
  String? title;
  String? description;
  @JsonKey(name: 'num_tokens')
  int? numTokens;
  @JsonKey(name: 'last_updated')
  DateTime? lastUpdated;
  @JsonKey(name: 'avg_price_change')
  double? avgPriceChange;
  @JsonKey(name: 'market_cap')
  double? marketCap;
  @JsonKey(name: 'market_cap_change')
  double? marketCapChange;
  double? volume;
  @JsonKey(name: 'volume_change')
  double? volumeChange;
  List<CoinModel>? coins;

  VcsEntity toEntity() {
    return VcsEntity(
      id: id,
      name: name,
      title: title,
      description: description,
      numTokens: numTokens,
      lastUpdated: lastUpdated,
      avgPriceChange: avgPriceChange,
      marketCap: marketCap,
      marketCapChange: marketCapChange,
      volume: volume,
      volumeChange: volumeChange,
      coins: coins?.map((e) => e.toEntity()).toList(),
    );
  }
}
