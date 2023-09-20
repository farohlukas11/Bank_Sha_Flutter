part of 'logout_bloc.dart';

abstract class LogoutEvent extends Equatable {
  const LogoutEvent();
}

class OnLogOutEvent extends LogoutEvent {
  @override
  List<Object?> get props => [];
}
