part of 'get_token_bloc.dart';

abstract class GetTokenState extends Equatable {
  const GetTokenState();
}

class GetTokenInitial extends GetTokenState {
  @override
  List<Object> get props => [];
}

class GetTokenHasData extends GetTokenState {
  @override
  List<Object?> get props => [];
}

class GetTokenEmpty extends GetTokenState {
  @override
  List<Object?> get props => [];
}
