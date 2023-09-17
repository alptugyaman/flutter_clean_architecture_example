import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_clean_architecture/src/features/vcs/domain/entities/coin_model.dart';
import 'package:flutter_clean_architecture/src/features/vcs/domain/entities/vcs_model.dart';
import 'package:flutter_clean_architecture/src/features/vcs/domain/usecases/vcs_usecase.dart';

part 'get_vc_data_state.dart';

class GetVcDataCubit extends Cubit<GetVcDataState> {
  GetVcDataCubit(this._vcsUsecase) : super(GetVcDataInitial());

  Future<void> getVc({required String id}) async {
    try {
      emit(GetVcDataLoading());

      final result = await _vcsUsecase.getVcs(id: id);

      result.fold(
        (error) => emit(GetVcDataError(errorMessage: error.message)),
        (data) => emit(GetVcDataSuccess(vc: data)),
      );
    } catch (_) {
      rethrow;
    }
  }

  final VcsUsecase _vcsUsecase;
}
