part of 'get_user_bloc.dart';

abstract class GetUserState extends Equatable {
  const GetUserState();
}

class GetUserInitial extends GetUserState {
  @override
  List<Object> get props => [];
}

class GetUserHasData extends GetUserState {
  final UserModel model;

  GetUserHasData(this.model);

  @override
  List<Object?> get props => [model];
}

class GetUserError extends GetUserState {
  @override
  List<Object?> get props => [];
}

class GetUserError401 extends GetUserState {
  @override
  List<Object?> get props => [];
}
