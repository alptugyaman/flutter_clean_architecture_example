import 'package:equatable/equatable.dart';
import 'package:flutter_clean_architecture/src/features/data/models/listings_model/listings_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'status_model.g.dart';

@JsonSerializable(createToJson: false)
class StatusModel extends Equatable {
  const StatusModel({
    this.timestamp,
    this.errorCode,
    this.errorMessage,
    this.elapsed,
    this.creditCount,
    this.listings,
  });

  factory StatusModel.fromJson(Map<String, dynamic> json) {
    return _$StatusModelFromJson(json);
  }

  final DateTime? timestamp;
  @JsonKey(name: 'error_code')
  final int? errorCode;
  @JsonKey(name: 'error_message')
  final String? errorMessage;
  final int? elapsed;
  @JsonKey(name: 'credit_count')
  final int? creditCount;
  final List<ListingsModel>? listings;

  @override
  List<Object?> get props {
    return [
      timestamp,
      errorCode,
      errorMessage,
      elapsed,
      creditCount,
    ];
  }
}
