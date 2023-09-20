part of 'get_user_bloc.dart';

abstract class GetUserEvent extends Equatable {
  const GetUserEvent();
}

class OnGetUserEvent extends GetUserEvent {
  @override
  List<Object?> get props => [];
}
