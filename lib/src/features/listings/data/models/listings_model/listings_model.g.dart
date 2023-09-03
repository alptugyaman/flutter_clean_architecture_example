// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'listings_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ListingsModel _$ListingsModelFromJson(Map<String, dynamic> json) =>
    ListingsModel(
      id: json['id'] as int?,
      name: json['name'] as String?,
      symbol: json['symbol'] as String?,
      slug: json['slug'] as String?,
      numMarketPairs: json['num_market_pairs'] as int?,
      dateAdded: json['date_added'] == null
          ? null
          : DateTime.parse(json['date_added'] as String),
      tags: (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList(),
      maxSupply: (json['max_supply'] as num?)?.toDouble(),
      circulatingSupply: (json['circulating_supply'] as num?)?.toDouble(),
      totalSupply: (json['total_supply'] as num?)?.toDouble(),
      infiniteSupply: json['infinite_supply'] as bool?,
      platform: json['platform'],
      cmcRank: json['cmc_rank'] as int?,
      selfReportedCirculatingSupply: json['self_reported_circulating_supply'],
      selfReportedMarketCap: json['self_reported_market_cap'],
      tvlRatio: json['tvl_ratio'],
      lastUpdated: json['last_updated'] == null
          ? null
          : DateTime.parse(json['last_updated'] as String),
      quote: json['quote'] == null
          ? null
          : QuoteModel.fromJson(json['quote'] as Map<String, dynamic>),
    );
