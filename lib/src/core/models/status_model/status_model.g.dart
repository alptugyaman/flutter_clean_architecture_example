// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'status_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StatusModel _$StatusModelFromJson(Map<String, dynamic> json) => StatusModel(
      timestamp: json['timestamp'] == null
          ? null
          : DateTime.parse(json['timestamp'] as String),
      errorCode: json['error_code'] as int?,
      errorMessage: json['error_message'] as String?,
      elapsed: json['elapsed'] as int?,
      creditCount: json['credit_count'] as int?,
      listings: (json['data'] as List<dynamic>?)
          ?.map((e) => ListingsModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
