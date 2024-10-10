part of 'refresh_token_bloc.dart';

abstract class RefreshTokenEvent extends Equatable {
  const RefreshTokenEvent();

  @override
  List<Object> get props => [];
}

class TapRefreshTokenEvent extends RefreshTokenEvent {
  final String refreshToken;
  const TapRefreshTokenEvent({required this.refreshToken});
}
