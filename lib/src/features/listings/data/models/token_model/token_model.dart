import 'package:equatable/equatable.dart';
import 'package:flutter_clean_architecture/src/features/listings/domain/entities/token_entity/token_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'token_model.g.dart';

@JsonSerializable(createToJson: false)
class TokenModel extends Equatable {
  const TokenModel({
    this.id,
    this.name,
    this.symbol,
    this.category,
    this.description,
    this.slug,
    this.logo,
    this.subreddit,
    this.notice,
    this.tags,
    this.tagNames,
    this.tagGroups,
    this.platform,
    this.dateAdded,
    this.twitterUsername,
    this.isHidden,
    this.dateLaunched,
    this.contractAddress,
    this.selfReportedCirculatingSupply,
    this.selfReportedTags,
    this.selfReportedMarketCap,
    this.infiniteSupply,
  });

  factory TokenModel.fromJson(Map<String, dynamic> json) {
    return _$TokenModelFromJson(json);
  }

  final int? id;
  final String? name;
  final String? symbol;
  final String? category;
  final String? description;
  final String? slug;
  final String? logo;
  final String? subreddit;
  final String? notice;
  final List<String>? tags;
  @JsonKey(name: 'tag-names')
  final List<String>? tagNames;
  @JsonKey(name: 'tag-groups')
  final List<String>? tagGroups;
  final dynamic platform;
  @JsonKey(name: 'date_added')
  final DateTime? dateAdded;
  @JsonKey(name: 'twitter_username')
  final String? twitterUsername;
  @JsonKey(name: 'is_hidden')
  final int? isHidden;
  @JsonKey(name: 'date_launched')
  final DateTime? dateLaunched;
  @JsonKey(name: 'contract_address')
  final List<dynamic>? contractAddress;
  @JsonKey(name: 'self_reported_circulating_supply')
  final dynamic selfReportedCirculatingSupply;
  @JsonKey(name: 'self_reported_tags')
  final dynamic selfReportedTags;
  @JsonKey(name: 'self_reported_market_cap')
  final dynamic selfReportedMarketCap;
  @JsonKey(name: 'infinite_supply')
  final bool? infiniteSupply;

  TokenEntity toEntity() => TokenEntity(
        id: id,
        name: name,
        symbol: symbol,
        category: category,
        description: description,
        slug: slug,
        logo: logo,
        subreddit: subreddit,
        notice: notice,
        tags: tags,
        tagNames: tagNames,
        tagGroups: tagGroups,
        platform: platform,
        dateAdded: dateAdded,
        twitterUsername: twitterUsername,
        isHidden: isHidden,
        dateLaunched: dateLaunched,
        contractAddress: contractAddress,
        selfReportedCirculatingSupply: selfReportedCirculatingSupply,
        selfReportedTags: selfReportedTags,
        selfReportedMarketCap: selfReportedMarketCap,
        infiniteSupply: infiniteSupply,
      );

  @override
  List<Object?> get props {
    return [
      id,
      name,
      symbol,
      category,
      description,
      slug,
      logo,
      subreddit,
      notice,
      tags,
      tagNames,
      tagGroups,
      platform,
      dateAdded,
      twitterUsername,
      isHidden,
      dateLaunched,
      contractAddress,
      selfReportedCirculatingSupply,
      selfReportedTags,
      selfReportedMarketCap,
      infiniteSupply,
    ];
  }
}
