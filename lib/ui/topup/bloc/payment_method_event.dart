part of 'payment_method_bloc.dart';

abstract class PaymentMethodEvent extends Equatable {
  const PaymentMethodEvent();
}

class OnPaymentMethodEvent extends PaymentMethodEvent {
  @override
  List<Object?> get props => [];
}
