part of 'topup_method_bloc.dart';

abstract class TopupMethodState extends Equatable {
  const TopupMethodState();
}

class TopupMethodInitial extends TopupMethodState {
  @override
  List<Object> get props => [];
}

class TopupMethodLoading extends TopupMethodState {
  @override
  List<Object> get props => [];
}

class TopupMethodError extends TopupMethodState {
  @override
  List<Object> get props => [];
}

class TopupMethodHasData extends TopupMethodState {
  final String paymentUrl;

  TopupMethodHasData(this.paymentUrl);

  @override
  List<Object> get props => [paymentUrl];
}

class TopupMethodGetData extends TopupMethodState {
  final TopUpFormModel model;

  TopupMethodGetData(this.model);

  @override
  List<Object> get props => [model];
}
