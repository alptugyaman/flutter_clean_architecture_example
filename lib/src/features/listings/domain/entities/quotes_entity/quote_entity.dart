import 'package:equatable/equatable.dart';
import 'package:flutter_clean_architecture/src/features/listings/domain/entities/usd_entity/usd_entity.dart';

class QuoteEntity extends Equatable {
  const QuoteEntity({this.usdEntity});

  final UsdEntity? usdEntity;

  @override
  List<Object?> get props => [usdEntity];
}
