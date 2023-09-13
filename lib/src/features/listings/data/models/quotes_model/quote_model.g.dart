// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quote_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QuoteModel _$QuoteModelFromJson(Map<String, dynamic> json) => QuoteModel(
      usdModel: json['USD'] == null
          ? null
          : UsdModel.fromJson(json['USD'] as Map<String, dynamic>),
    );
