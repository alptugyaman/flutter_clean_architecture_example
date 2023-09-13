part of 'get_token_cubit.dart';

sealed class GetTokenState extends Equatable {
  const GetTokenState();

  @override
  List<Object> get props => [];
}

final class GetTokenInitial extends GetTokenState {}

final class GetTokenLoading extends GetTokenState {}

final class GetTokenError extends GetTokenState {
  const GetTokenError(this.message);

  final String message;

  @override
  List<Object> get props => [message];
}

final class GetTokenSuccess extends GetTokenState {
  const GetTokenSuccess(this.token);

  final TokenEntity token;

  @override
  List<Object> get props => [token];
}
