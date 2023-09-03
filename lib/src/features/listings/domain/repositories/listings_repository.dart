import 'package:dartz/dartz.dart';
import 'package:flutter_clean_architecture/src/core/network/network_exception.dart';
import 'package:flutter_clean_architecture/src/features/listings/domain/entities/listings_entity/listings_entity.dart';

abstract class ListingsRepository {
  Future<Either<NetworkException, List<ListingsEntity>?>> getListings({
    required int start,
    required int limit,
  });
}
