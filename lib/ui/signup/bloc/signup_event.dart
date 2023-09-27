part of 'signup_bloc.dart';

abstract class SignupEvent extends Equatable {
  const SignupEvent();
}

class OnRegisterEvent extends SignupEvent {
  final SignUpFormModel model;

  OnRegisterEvent(this.model);

  @override
  List<Object?> get props => [model];
}
