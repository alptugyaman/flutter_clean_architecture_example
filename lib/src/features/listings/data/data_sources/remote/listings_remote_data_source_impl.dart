// ignore_for_file: avoid_dynamic_calls, unnecessary_string_interpolations

import 'package:flutter_clean_architecture/src/core/constants/url_constants.dart';
import 'package:flutter_clean_architecture/src/core/models/status_model/status_model.dart';
import 'package:flutter_clean_architecture/src/core/network/dio_client.dart';
import 'package:flutter_clean_architecture/src/features/listings/data/data_sources/remote/listings_remote_data_source.dart';
import 'package:flutter_clean_architecture/src/features/listings/data/models/listings_model/listings_model.dart';
import 'package:flutter_clean_architecture/src/features/listings/data/models/token_model/token_model.dart';

class ListingsRemoteDataSourceImpl extends ListingsRemoteDataSource {
  ListingsRemoteDataSourceImpl(this.dioClient);

  DioClient dioClient;

  @override
  Future<List<ListingsModel>?> getListings({
    required int start,
    required int limit,
  }) async {
    try {
      final response = await dioClient.get(
        UrlContants.listings,
        queryParameters: {
          'start': start,
          'limit': limit,
        },
      );

      final status = StatusModel.fromJson(
        response.data as Map<String, dynamic>,
      );

      final listings = status.listings;

      return listings;
    } on Exception catch (_) {
      rethrow;
    }
  }

  @override
  Future<TokenModel> getToken({required String id}) async {
    try {
      final response = await dioClient.get(
        UrlContants.token,
        queryParameters: {'id': id},
      );

      final token = TokenModel.fromJson(
        response.data['data'][id] as Map<String, dynamic>,
      );

      return token;
    } on Exception catch (_) {
      rethrow;
    }
  }
}
