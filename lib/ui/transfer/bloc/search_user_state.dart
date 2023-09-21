part of 'search_user_bloc.dart';

abstract class SearchUserState extends Equatable {
  const SearchUserState();
}

class SearchUserInitial extends SearchUserState {
  @override
  List<Object> get props => [];
}

class SearchUserHasEmpty extends SearchUserState {
  @override
  List<Object> get props => [];
}

class SearchUserLoading extends SearchUserState {
  @override
  List<Object> get props => [];
}

class SearchUserHasData extends SearchUserState {
  final List<UserModel> listModel;

  SearchUserHasData(this.listModel);

  @override
  List<Object> get props => [listModel];
}

class SearchUserError extends SearchUserState {
  final String message;

  SearchUserError(this.message);

  @override
  List<Object> get props => [message];
}
