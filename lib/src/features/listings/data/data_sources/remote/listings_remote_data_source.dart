import 'package:flutter_clean_architecture/src/features/listings/data/models/listings_model/listings_model.dart';

abstract class ListingsRemoteDataSource {
  Future<List<ListingsModel>?> getListings({
    required int start,
    required int limit,
  });
}
