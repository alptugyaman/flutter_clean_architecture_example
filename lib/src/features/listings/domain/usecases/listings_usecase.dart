import 'package:dartz/dartz.dart';
import 'package:flutter_clean_architecture/src/core/network/network_exception.dart';
import 'package:flutter_clean_architecture/src/features/listings/domain/entities/listings_entity/listings_entity.dart';
import 'package:flutter_clean_architecture/src/features/listings/domain/entities/token_entity/token_entity.dart';
import 'package:flutter_clean_architecture/src/features/listings/domain/repositories/listings_repository.dart';

final class ListingsUsecase {
  const ListingsUsecase(this.listingsRepository);
  final ListingsRepository listingsRepository;

  Future<Either<NetworkException, List<ListingsEntity>?>> getListings({
    required int start,
    required int limit,
  }) async {
    final listings = await listingsRepository.getListings(
      start: start,
      limit: limit,
    );

    return listings;
  }

  Future<Either<NetworkException, TokenEntity>> getToken({
    required String id,
  }) async {
    final token = await listingsRepository.getToken(id: id);

    return token;
  }
}
