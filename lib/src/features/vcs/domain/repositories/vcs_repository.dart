// ignore_for_file: one_member_abstracts

import 'package:dartz/dartz.dart';
import 'package:flutter_clean_architecture/src/core/network/network_exception.dart';
import 'package:flutter_clean_architecture/src/features/vcs/domain/entities/vcs_model.dart';

abstract class VcsRepository {
  Future<Either<NetworkException, VcsEntity>> getVcs({required String id});
}
