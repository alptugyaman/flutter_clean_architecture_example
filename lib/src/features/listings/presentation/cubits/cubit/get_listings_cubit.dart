import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_clean_architecture/src/core/constants/int_constants.dart';
import 'package:flutter_clean_architecture/src/features/listings/domain/entities/listings_entity/listings_entity.dart';
import 'package:flutter_clean_architecture/src/features/listings/domain/usecases/listings_usecase.dart';

part 'get_listings_state.dart';

class GetListingsCubit extends Cubit<GetListingsState> {
  GetListingsCubit(this._listingsUsecase) : super(GetListingsInitial());

  List<ListingsEntity>? listings = [];
  bool hasReachedMax = false;

  Future<void> getListings() async {
    try {
      emit(GetListingsLoading());

      listings?.clear();

      final result = await _listingsUsecase.getListings(
        start: IntContants.start,
        limit: IntContants.limit,
      );

      result.fold(
        (error) => emit(GetListingsError(error.message)),
        (data) {
          if (data?.isNotEmpty ?? false) {
            listings?.addAll(data ?? []);

            emit(GetListingsSuccess(listings: listings));
          } else {
            emit(GetListingsEmpty());
          }
        },
      );
    } on Exception catch (_) {
      rethrow;
    }
  }

  Future<void> getMoreListings() async {
    try {
      if (hasReachedMax) return;

      final result = await _listingsUsecase.getListings(
        start: (listings?.length ?? 0) + 1,
        limit: IntContants.limit,
      );

      result.fold(
        (error) => emit(GetListingsError(error.message)),
        (data) {
          if (data?.isEmpty ?? true) {
            hasReachedMax = true;
          } else {
            if (data!.length < IntContants.limit) hasReachedMax = true;

            emit(
              GetListingsSuccess(
                listings: List.from(listings!)..addAll(data),
              ),
            );

            listings?.addAll(data);
          }
        },
      );
    } on Exception catch (_) {
      rethrow;
    }
  }

  final ListingsUsecase _listingsUsecase;
}
