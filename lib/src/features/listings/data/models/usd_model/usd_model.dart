import 'package:equatable/equatable.dart';
import 'package:flutter_clean_architecture/src/features/listings/domain/entities/usd_entity/usd_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'usd_model.g.dart';

@JsonSerializable(createToJson: false)
class UsdModel extends Equatable {
  const UsdModel({
    this.price,
    this.volume24h,
    this.volumeChange24h,
    this.percentChange1h,
    this.percentChange24h,
    this.percentChange7d,
    this.percentChange30d,
    this.percentChange60d,
    this.percentChange90d,
    this.marketCap,
    this.marketCapDominance,
    this.fullyDilutedMarketCap,
    this.tvl,
    this.lastUpdated,
  });

  factory UsdModel.fromJson(Map<String, dynamic> json) =>
      _$UsdModelFromJson(json);

  UsdEntity toEntity() => UsdEntity(
        price: price,
        volume24h: volume24h,
        volumeChange24h: volumeChange24h,
        percentChange1h: percentChange1h,
        percentChange24h: percentChange24h,
        percentChange7d: percentChange7d,
        percentChange30d: percentChange30d,
        percentChange60d: percentChange60d,
        percentChange90d: percentChange90d,
        marketCap: marketCap,
        marketCapDominance: marketCapDominance,
        fullyDilutedMarketCap: fullyDilutedMarketCap,
        tvl: tvl,
        lastUpdated: lastUpdated,
      );

  final double? price;
  @JsonKey(name: 'volume_24h')
  final double? volume24h;
  @JsonKey(name: 'volume_change_24h')
  final double? volumeChange24h;
  @JsonKey(name: 'percent_change_1h')
  final double? percentChange1h;
  @JsonKey(name: 'percent_change_24h')
  final double? percentChange24h;
  @JsonKey(name: 'percent_change_7d')
  final double? percentChange7d;
  @JsonKey(name: 'percent_change_30d')
  final double? percentChange30d;
  @JsonKey(name: 'percent_change_60d')
  final double? percentChange60d;
  @JsonKey(name: 'percent_change_90d')
  final double? percentChange90d;
  @JsonKey(name: 'market_cap')
  final double? marketCap;
  @JsonKey(name: 'market_cap_dominance')
  final double? marketCapDominance;
  @JsonKey(name: 'fully_diluted_market_cap')
  final double? fullyDilutedMarketCap;
  final dynamic tvl;
  @JsonKey(name: 'last_updated')
  final DateTime? lastUpdated;

  @override
  List<Object?> get props {
    return [
      price,
      volume24h,
      volumeChange24h,
      percentChange1h,
      percentChange24h,
      percentChange7d,
      percentChange30d,
      percentChange60d,
      percentChange90d,
      marketCap,
      marketCapDominance,
      fullyDilutedMarketCap,
      tvl,
      lastUpdated,
    ];
  }
}
