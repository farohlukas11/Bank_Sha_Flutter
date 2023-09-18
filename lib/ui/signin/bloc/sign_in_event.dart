part of 'sign_in_bloc.dart';

abstract class SignInEvent extends Equatable {
  const SignInEvent();
}

class OnSignInEvent extends SignInEvent {
  final SignInFormModel model;

  OnSignInEvent(this.model);

  @override
  List<Object?> get props => [model];
}
