part of 'sign_in_bloc.dart';

abstract class SignInState extends Equatable {
  const SignInState();
}

class SignInInitial extends SignInState {
  @override
  List<Object> get props => [];
}

class SignInLoading extends SignInState {
  @override
  List<Object?> get props => [];
}

class SignInError extends SignInState {
  final String error;

  SignInError(this.error);

  @override
  List<Object?> get props => [error];
}

class SignInHasData extends SignInState {
  final UserModel model;

  SignInHasData(this.model);

  @override
  List<Object?> get props => [model];
}
