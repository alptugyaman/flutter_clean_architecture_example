// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vcs_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VcsModel _$VcsModelFromJson(Map<String, dynamic> json) => VcsModel(
      id: json['id'] as String?,
      name: json['name'] as String?,
      title: json['title'] as String?,
      description: json['description'] as String?,
      numTokens: json['num_tokens'] as int?,
      lastUpdated: json['last_updated'] == null
          ? null
          : DateTime.parse(json['last_updated'] as String),
      avgPriceChange: (json['avg_price_change'] as num?)?.toDouble(),
      marketCap: (json['market_cap'] as num?)?.toDouble(),
      marketCapChange: (json['market_cap_change'] as num?)?.toDouble(),
      volume: (json['volume'] as num?)?.toDouble(),
      volumeChange: (json['volume_change'] as num?)?.toDouble(),
      coins: (json['coins'] as List<dynamic>?)
          ?.map((e) => CoinModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
