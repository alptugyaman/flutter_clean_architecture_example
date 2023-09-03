import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_clean_architecture/src/features/listings/domain/entities/listings_entity/listings_entity.dart';
import 'package:flutter_clean_architecture/src/features/listings/domain/usecases/listings_usecase.dart';

part 'get_listings_state.dart';

class GetListingsCubit extends Cubit<GetListingsState> {
  GetListingsCubit(this._listingsUsecase) : super(GetListingsInitial());

  Future<void> getListings({
    required int start,
    required int limit,
  }) async {
    try {
      emit(GetListingsLoading());

      final result = await _listingsUsecase.getListings(
        start: start,
        limit: limit,
      );

      result.fold(
        (err) => emit(GetListingsError(err.message)),
        (data) => emit(GetListingsSuccess(listings: data)),
      );
    } on Exception catch (_) {
      rethrow;
    }
  }

  final ListingsUsecase _listingsUsecase;
}
