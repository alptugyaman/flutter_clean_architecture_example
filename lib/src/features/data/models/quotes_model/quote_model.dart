import 'package:equatable/equatable.dart';
import 'package:flutter_clean_architecture/src/features/data/models/usd_model/usd_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'quote_model.g.dart';

@JsonSerializable(createToJson: false)
class QuoteModel extends Equatable {
  const QuoteModel({this.usdModel});

  factory QuoteModel.fromJson(Map<String, dynamic> json) =>
      _$QuoteModelFromJson(json);

  final UsdModel? usdModel;

  @override
  List<Object?> get props => [usdModel];
}
