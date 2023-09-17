part of 'signup_bloc.dart';

abstract class SignupState extends Equatable {
  const SignupState();
}

class SignupInitial extends SignupState {
  @override
  List<Object> get props => [];
}

class SignupLoading extends SignupState {
  @override
  List<Object> get props => [];
}

class SignupError extends SignupState {
  final String message;

  SignupError(this.message);

  @override
  List<Object> get props => [message];
}

class SignupHasData extends SignupState {
  final UserModel userModel;

  SignupHasData(this.userModel);

  @override
  List<Object> get props => [userModel];
}
