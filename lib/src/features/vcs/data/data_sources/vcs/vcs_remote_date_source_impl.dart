// ignore_for_file: avoid_dynamic_calls

import 'package:flutter_clean_architecture/src/core/constants/url_constants.dart';
import 'package:flutter_clean_architecture/src/core/network/dio_client.dart';
import 'package:flutter_clean_architecture/src/features/vcs/data/data_sources/vcs/vcs_remote_date_source.dart';
import 'package:flutter_clean_architecture/src/features/vcs/data/models/vcs_model.dart';

class VcsRemoteDataSourceImpl implements VcsRemoteDataSource {
  VcsRemoteDataSourceImpl(this.dioClient);

  DioClient dioClient;

  @override
  Future<VcsModel> getVcs({required String id}) async {
    try {
      final response = await dioClient.get(
        UrlContants.category,
        queryParameters: {'id': id},
      );

      final vcs = VcsModel.fromJson(
        response.data['data'] as Map<String, dynamic>,
      );

      return vcs;
    } on Exception catch (_) {
      rethrow;
    }
  }
}
