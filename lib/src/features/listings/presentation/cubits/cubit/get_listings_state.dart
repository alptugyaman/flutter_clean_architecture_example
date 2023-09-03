part of 'get_listings_cubit.dart';

sealed class GetListingsState extends Equatable {
  const GetListingsState();

  @override
  List<Object?> get props => [];
}

final class GetListingsInitial extends GetListingsState {}

final class GetListingsLoading extends GetListingsState {}

final class GetListingsSuccess extends GetListingsState {
  const GetListingsSuccess({
    required this.listings,
  });

  final List<ListingsEntity>? listings;

  @override
  List<Object?> get props => [listings];
}

final class GetListingsEmpty extends GetListingsState {}

final class GetListingsError extends GetListingsState {
  const GetListingsError(this.errorMessage);

  final String errorMessage;

  @override
  List<Object> get props => [errorMessage];
}
