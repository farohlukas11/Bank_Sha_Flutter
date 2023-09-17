part of 'check_email_bloc.dart';

abstract class CheckEmailEvent extends Equatable {
  const CheckEmailEvent();
}

class OnCheckEmailEvent extends CheckEmailEvent {
  final SignUpFormModel model;

  OnCheckEmailEvent(this.model);

  @override
  List<Object?> get props => [model];
}
