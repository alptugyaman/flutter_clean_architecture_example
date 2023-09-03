// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'usd_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UsdModel _$UsdModelFromJson(Map<String, dynamic> json) => UsdModel(
      price: (json['price'] as num?)?.toDouble(),
      volume24h: (json['volume_24h'] as num?)?.toDouble(),
      volumeChange24h: (json['volume_change_24h'] as num?)?.toDouble(),
      percentChange1h: (json['percent_change_1h'] as num?)?.toDouble(),
      percentChange24h: (json['percent_change_24h'] as num?)?.toDouble(),
      percentChange7d: (json['percent_change_7d'] as num?)?.toDouble(),
      percentChange30d: (json['percent_change_30d'] as num?)?.toDouble(),
      percentChange60d: (json['percent_change_60d'] as num?)?.toDouble(),
      percentChange90d: (json['percent_change_90d'] as num?)?.toDouble(),
      marketCap: (json['market_cap'] as num?)?.toDouble(),
      marketCapDominance: (json['market_cap_dominance'] as num?)?.toDouble(),
      fullyDilutedMarketCap:
          (json['fully_diluted_market_cap'] as num?)?.toDouble(),
      tvl: json['tvl'],
      lastUpdated: json['last_updated'] == null
          ? null
          : DateTime.parse(json['last_updated'] as String),
    );
