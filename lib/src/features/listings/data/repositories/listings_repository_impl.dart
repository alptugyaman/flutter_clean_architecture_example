import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_clean_architecture/src/core/network/network_exception.dart';
import 'package:flutter_clean_architecture/src/features/listings/data/data_sources/remote/listings/listings_remote_data_source.dart';
import 'package:flutter_clean_architecture/src/features/listings/domain/entities/listings_entity/listings_entity.dart';
import 'package:flutter_clean_architecture/src/features/listings/domain/entities/token_entity/token_entity.dart';
import 'package:flutter_clean_architecture/src/features/listings/domain/repositories/listings_repository.dart';

class ListingsRepositoryImpl extends ListingsRepository {
  ListingsRepositoryImpl(this._listingsRemoteDataSource);
  final ListingsRemoteDataSource _listingsRemoteDataSource;

  @override
  Future<Either<NetworkException, List<ListingsEntity>?>> getListings({
    required int start,
    required int limit,
  }) async {
    try {
      final result = await _listingsRemoteDataSource.getListings(
        start: start,
        limit: limit,
      );

      return Right(result?.map((e) => e.toEntity()).toList());
    } on DioException catch (e) {
      return Left(NetworkException(e));
    }
  }

  @override
  Future<Either<NetworkException, TokenEntity>> getToken({
    required String id,
  }) async {
    try {
      final result = await _listingsRemoteDataSource.getToken(
        id: id,
      );

      return Right(result.toEntity());
    } on DioException catch (e) {
      return Left(NetworkException(e));
    }
  }
}
