import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_clean_architecture/src/features/listings/domain/entities/token_entity/token_entity.dart';
import 'package:flutter_clean_architecture/src/features/listings/domain/usecases/listings_usecase.dart';

part 'get_token_state.dart';

class GetTokenCubit extends Cubit<GetTokenState> {
  GetTokenCubit(this._listingsUsecase) : super(GetTokenInitial());

  Future<void> getToken(String id) async {
    try {
      emit(GetTokenLoading());

      final result = await _listingsUsecase.getToken(id: id);

      result.fold(
        (error) => emit(GetTokenError(error.message)),
        (data) => emit(GetTokenSuccess(data)),
      );
    } on Exception catch (_) {
      rethrow;
    }
  }

  final ListingsUsecase _listingsUsecase;
}
