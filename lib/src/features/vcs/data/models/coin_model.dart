import 'package:flutter_clean_architecture/src/features/listings/data/models/quotes_model/quote_model.dart';
import 'package:flutter_clean_architecture/src/features/vcs/domain/entities/coin_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'coin_model.g.dart';

@JsonSerializable(createToJson: false)
class CoinModel {
  CoinModel({
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
    this.isActive,
    this.infiniteSupply,
    this.platform,
    this.cmcRank,
    this.isFiat,
    this.selfReportedCirculatingSupply,
    this.selfReportedMarketCap,
    this.tvlRatio,
    this.lastUpdated,
    this.quote,
  });

  factory CoinModel.fromJson(Map<String, dynamic> json) =>
      _$CoinModelFromJson(json);

  int? id;
  String? name;
  String? symbol;
  String? slug;
  @JsonKey(name: 'num_market_pairs')
  int? numMarketPairs;
  @JsonKey(name: 'date_added')
  DateTime? dateAdded;
  List<String>? tags;
  @JsonKey(name: 'max_supply')
  int? maxSupply;
  @JsonKey(name: 'circulating_supply')
  double? circulatingSupply;
  @JsonKey(name: 'total_supply')
  double? totalSupply;
  @JsonKey(name: 'is_active')
  int? isActive;
  @JsonKey(name: 'infinite_supply')
  bool? infiniteSupply;
  dynamic platform;
  @JsonKey(name: 'cmc_rank')
  int? cmcRank;
  @JsonKey(name: 'is_fiat')
  int? isFiat;
  @JsonKey(name: 'self_reported_circulating_supply')
  dynamic selfReportedCirculatingSupply;
  @JsonKey(name: 'self_reported_market_cap')
  dynamic selfReportedMarketCap;
  @JsonKey(name: 'tvl_ratio')
  dynamic tvlRatio;
  @JsonKey(name: 'last_updated')
  DateTime? lastUpdated;
  QuoteModel? quote;

  CoinEntity toEntity() => CoinEntity(
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
        isActive: isActive,
        infiniteSupply: infiniteSupply,
        platform: platform,
        cmcRank: cmcRank,
        isFiat: isFiat,
        selfReportedCirculatingSupply: selfReportedCirculatingSupply,
        selfReportedMarketCap: selfReportedMarketCap,
        tvlRatio: tvlRatio,
        lastUpdated: lastUpdated,
        quote: quote?.toEntity(),
      );
}
