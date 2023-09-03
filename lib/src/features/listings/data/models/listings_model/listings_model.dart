import 'package:equatable/equatable.dart';
import 'package:flutter_clean_architecture/src/features/listings/data/models/quotes_model/quote_model.dart';
import 'package:flutter_clean_architecture/src/features/listings/domain/entities/listings_entity/listings_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'listings_model.g.dart';

@JsonSerializable(createToJson: false)
class ListingsModel extends Equatable {
  const ListingsModel({
    this.id,
    this.name,
    this.symbol,
    this.slug,
    this.numMarketPairs,
    this.dateAdded,
    this.tags,
    this.maxSupply,
    this.circulatingSupply,
    this.totalSupply,
    this.infiniteSupply,
    this.platform,
    this.cmcRank,
    this.selfReportedCirculatingSupply,
    this.selfReportedMarketCap,
    this.tvlRatio,
    this.lastUpdated,
    this.quote,
  });

  factory ListingsModel.fromJson(Map<String, dynamic> json) {
    return _$ListingsModelFromJson(json);
  }

  ListingsEntity toEntity() => ListingsEntity(
        id: id,
        name: name,
        symbol: symbol,
        slug: slug,
        numMarketPairs: numMarketPairs,
        dateAdded: dateAdded,
        tags: tags,
        maxSupply: maxSupply,
        circulatingSupply: circulatingSupply,
        totalSupply: totalSupply,
        infiniteSupply: infiniteSupply,
        platform: platform,
        cmcRank: cmcRank,
        selfReportedCirculatingSupply: selfReportedCirculatingSupply,
        selfReportedMarketCap: selfReportedMarketCap,
        tvlRatio: tvlRatio,
        lastUpdated: lastUpdated,
        quote: quote?.toEntity(),
      );

  final int? id;
  final String? name;
  final String? symbol;
  final String? slug;
  @JsonKey(name: 'num_market_pairs')
  final int? numMarketPairs;
  @JsonKey(name: 'date_added')
  final DateTime? dateAdded;
  final List<String>? tags;
  @JsonKey(name: 'max_supply')
  final double? maxSupply;
  @JsonKey(name: 'circulating_supply')
  final double? circulatingSupply;
  @JsonKey(name: 'total_supply')
  final double? totalSupply;
  @JsonKey(name: 'infinite_supply')
  final bool? infiniteSupply;
  final dynamic platform;
  @JsonKey(name: 'cmc_rank')
  final int? cmcRank;
  @JsonKey(name: 'self_reported_circulating_supply')
  final dynamic selfReportedCirculatingSupply;
  @JsonKey(name: 'self_reported_market_cap')
  final dynamic selfReportedMarketCap;
  @JsonKey(name: 'tvl_ratio')
  final dynamic tvlRatio;
  @JsonKey(name: 'last_updated')
  final DateTime? lastUpdated;
  final QuoteModel? quote;

  @override
  List<Object?> get props {
    return [
      id,
      name,
      symbol,
      slug,
      numMarketPairs,
      dateAdded,
      tags,
      maxSupply,
      circulatingSupply,
      totalSupply,
      infiniteSupply,
      platform,
      cmcRank,
      selfReportedCirculatingSupply,
      selfReportedMarketCap,
      tvlRatio,
      lastUpdated,
      quote,
    ];
  }
}
