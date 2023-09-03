import 'package:equatable/equatable.dart';

class UsdEntity extends Equatable {
  const UsdEntity({
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

  final double? price;
  final double? volume24h;
  final double? volumeChange24h;
  final double? percentChange1h;
  final double? percentChange24h;
  final double? percentChange7d;
  final double? percentChange30d;
  final double? percentChange60d;
  final double? percentChange90d;
  final double? marketCap;
  final double? marketCapDominance;
  final double? fullyDilutedMarketCap;
  final dynamic tvl;
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
