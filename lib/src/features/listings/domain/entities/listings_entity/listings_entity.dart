import 'package:equatable/equatable.dart';
import 'package:flutter_clean_architecture/src/features/listings/domain/entities/quotes_entity/quote_entity.dart';

class ListingsEntity extends Equatable {
  const ListingsEntity({
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

  final int? id;
  final String? name;
  final String? symbol;
  final String? slug;
  final int? numMarketPairs;
  final DateTime? dateAdded;
  final List<String>? tags;
  final double? maxSupply;
  final double? circulatingSupply;
  final double? totalSupply;
  final bool? infiniteSupply;
  final dynamic platform;
  final int? cmcRank;
  final dynamic selfReportedCirculatingSupply;
  final dynamic selfReportedMarketCap;
  final dynamic tvlRatio;
  final DateTime? lastUpdated;
  final QuoteEntity? quote;

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
