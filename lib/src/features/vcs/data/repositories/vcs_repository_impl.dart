import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_clean_architecture/src/core/network/network_exception.dart';
import 'package:flutter_clean_architecture/src/features/vcs/data/data_sources/vcs/vcs_remote_date_source.dart';
import 'package:flutter_clean_architecture/src/features/vcs/domain/entities/vcs_model.dart';
import 'package:flutter_clean_architecture/src/features/vcs/domain/repositories/vcs_repository.dart';

class VcsRepositoryImpl extends VcsRepository {
  VcsRepositoryImpl(this._vcsRemoteDataSource);
  final VcsRemoteDataSource _vcsRemoteDataSource;

  @override
  Future<Either<NetworkException, VcsEntity>> getVcs({
    required String id,
  }) async {
    try {
      final result = await _vcsRemoteDataSource.getVcs(
        id: id,
      );

      return Right(result.toEntity());
    } on DioException catch (e) {
      return Left(NetworkException(e));
    }
  }
}
