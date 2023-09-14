// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'token_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TokenModel _$TokenModelFromJson(Map<String, dynamic> json) => TokenModel(
      id: json['id'] as int?,
      name: json['name'] as String?,
      symbol: json['symbol'] as String?,
      category: json['category'] as String?,
      description: json['description'] as String?,
      slug: json['slug'] as String?,
      logo: json['logo'] as String?,
      subreddit: json['subreddit'] as String?,
      notice: json['notice'] as String?,
      tags: (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList(),
      tagNames: (json['tag-names'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      tagGroups: (json['tag-groups'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      platform: json['platform'],
      dateAdded: json['date_added'] == null
          ? null
          : DateTime.parse(json['date_added'] as String),
      twitterUsername: json['twitter_username'] as String?,
      isHidden: json['is_hidden'] as int?,
      dateLaunched: json['date_launched'] == null
          ? null
          : DateTime.parse(json['date_launched'] as String),
      contractAddress: json['contract_address'] as List<dynamic>?,
      selfReportedCirculatingSupply: json['self_reported_circulating_supply'],
      selfReportedTags: json['self_reported_tags'],
      selfReportedMarketCap: json['self_reported_market_cap'],
      infiniteSupply: json['infinite_supply'] as bool?,
    );
