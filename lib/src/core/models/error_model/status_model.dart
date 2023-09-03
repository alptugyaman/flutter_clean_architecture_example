import 'package:equatable/equatable.dart';
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
