part of 'check_email_bloc.dart';

abstract class CheckEmailState extends Equatable {
  const CheckEmailState();
}

class CheckEmailInitial extends CheckEmailState {
  @override
  List<Object> get props => [];
}

class CheckEmailLoading extends CheckEmailState {
  @override
  List<Object> get props => [];
}

class CheckEmailError extends CheckEmailState {
  final String message;

  CheckEmailError(this.message);

  @override
  List<Object> get props => [message];
}

class CheckEmailHasData extends CheckEmailState {
  final bool data;

  CheckEmailHasData(this.data);

  @override
  List<Object> get props => [data];
}
