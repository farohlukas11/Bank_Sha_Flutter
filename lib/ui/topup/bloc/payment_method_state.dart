part of 'payment_method_bloc.dart';

abstract class PaymentMethodState extends Equatable {
  const PaymentMethodState();
}

class PaymentMethodInitial extends PaymentMethodState {
  @override
  List<Object> get props => [];
}

class PaymentMethodLoading extends PaymentMethodState {
  @override
  List<Object> get props => [];
}

class PaymentMethodError extends PaymentMethodState {
  @override
  List<Object> get props => [];
}

class PaymentMethodHasData extends PaymentMethodState {
  final List<BankModel> listModel;

  PaymentMethodHasData(this.listModel);

  @override
  List<Object> get props => [listModel];
}
