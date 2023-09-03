import 'package:equatable/equatable.dart';
import 'package:flutter_clean_architecture/src/core/models/error_model/status_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'error_model.g.dart';

@JsonSerializable(createToJson: false)
class ErrorModel extends Equatable {
  const ErrorModel({this.statusModel});

  factory ErrorModel.fromJson(Map<String, dynamic> json) {
    return _$ErrorModelFromJson(json);
  }

  @JsonKey(name: 'status')
  final StatusModel? statusModel;

  @override
  List<Object?> get props => [statusModel];
}
