import 'package:flutter_clean_architecture/src/features/listings/domain/entities/quotes_entity/quote_entity.dart';

class CoinEntity {
  CoinEntity({
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

  int? id;
  String? name;
  String? symbol;
  String? slug;
  int? numMarketPairs;
  DateTime? dateAdded;
  List<String>? tags;
  int? maxSupply;
  double? circulatingSupply;
  double? totalSupply;
  int? isActive;
  bool? infiniteSupply;
  dynamic platform;
  int? cmcRank;
  int? isFiat;
  dynamic selfReportedCirculatingSupply;
  dynamic selfReportedMarketCap;
  dynamic tvlRatio;
  DateTime? lastUpdated;
  QuoteEntity? quote;
}
