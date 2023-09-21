part of 'search_user_bloc.dart';

abstract class SearchUserEvent extends Equatable {
  const SearchUserEvent();
}

class OnSearchUserEvent extends SearchUserEvent {
  final String username;

  OnSearchUserEvent(this.username);

  @override
  List<Object?> get props => [username];
}
