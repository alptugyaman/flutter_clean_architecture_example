import 'package:equatable/equatable.dart';
import 'package:flutter_clean_architecture/src/features/listings/domain/entities/usd_entity/usd_entity.dart';

class QuoteEntity extends Equatable {
  const QuoteEntity({this.usd});

  final UsdEntity? usd;

  @override
  List<Object?> get props => [usd];
}
