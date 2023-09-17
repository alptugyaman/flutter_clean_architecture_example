part of 'get_vc_data_cubit.dart';

sealed class GetVcDataState extends Equatable {
  const GetVcDataState();

  @override
  List<Object> get props => [];
}

final class GetVcDataInitial extends GetVcDataState {}

final class GetVcDataLoading extends GetVcDataState {}

final class GetVcDataEmpty extends GetVcDataState {}

final class GetVcDataSuccess extends GetVcDataState {
  const GetVcDataSuccess({required this.vc});

  final VcsEntity vc;

  List<CoinEntity>? get coinList =>
      vc.coins?.where((e) => e.name != null).toList();

  @override
  List<Object> get props => [vc.id!];
}

final class GetVcDataError extends GetVcDataState {
  const GetVcDataError({required this.errorMessage});

  final String errorMessage;

  @override
  List<Object> get props => [errorMessage];
}
