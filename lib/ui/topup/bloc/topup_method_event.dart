part of 'topup_method_bloc.dart';

abstract class TopupMethodEvent extends Equatable {
  const TopupMethodEvent();
}

class OnTopUpMethodEvent extends TopupMethodEvent {
  final TopUpFormModel model;

  OnTopUpMethodEvent(this.model);

  @override
  List<Object?> get props => [model];
}

class OnSetTopUpFormModelEvent extends TopupMethodEvent {
  final TopUpFormModel model;

  OnSetTopUpFormModelEvent(this.model);

  @override
  List<Object?> get props => [model];
}
