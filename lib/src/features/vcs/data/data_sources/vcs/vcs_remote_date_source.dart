// ignore_for_file: one_member_abstracts

import 'package:flutter_clean_architecture/src/features/vcs/data/models/vcs_model.dart';

abstract class VcsRemoteDataSource {
  Future<VcsModel> getVcs({
    required String id,
  });
}
