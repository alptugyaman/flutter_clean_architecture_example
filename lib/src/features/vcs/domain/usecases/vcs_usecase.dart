import 'package:dartz/dartz.dart';
import 'package:flutter_clean_architecture/src/core/network/network_exception.dart';
import 'package:flutter_clean_architecture/src/features/vcs/domain/entities/vcs_model.dart';
import 'package:flutter_clean_architecture/src/features/vcs/domain/repositories/vcs_repository.dart';

final class VcsUsecase {
  const VcsUsecase(this.vcsRepository);
  final VcsRepository vcsRepository;

  Future<Either<NetworkException, VcsEntity>> getVcs({
    required String id,
  }) async {
    final vcs = await vcsRepository.getVcs(id: id);

    return vcs;
  }
}
