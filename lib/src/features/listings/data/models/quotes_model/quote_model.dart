import 'package:equatable/equatable.dart';
import 'package:flutter_clean_architecture/src/features/listings/data/models/usd_model/usd_model.dart';
import 'package:flutter_clean_architecture/src/features/listings/domain/entities/quotes_entity/quote_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'quote_model.g.dart';

@JsonSerializable(createToJson: false)
class QuoteModel extends Equatable {
  const QuoteModel({this.usdModel});

  factory QuoteModel.fromJson(Map<String, dynamic> json) =>
      _$QuoteModelFromJson(json);

  QuoteEntity toEntity() => QuoteEntity(
        usdEntity: usdModel?.toEntity(),
      );

  final UsdModel? usdModel;

  @override
  List<Object?> get props => [usdModel];
}
